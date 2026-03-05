# Peliharaan AI - Project Knowledge

## Project Overview
Peliharaan AI is Indonesia's first AI-powered digital pet twin platform. Users upload 1-3 real pet photos, answer a behavioral questionnaire, and Qwen AI generates a living digital companion.

**Tagline:** "Hewan peliharaanmu, hidup di dunia digital" / "Your real pet. Digitally alive."

## Technology Stack

### Core Technologies (Alibaba Cloud Only)
- **Qwen-VL (qwen-vl-max)**: Vision model for pet photo analysis and twin generation
- **Qwen-Max**: Text model for interactive pet personality responses
- **Alibaba Cloud Model Studio**: API endpoint at `dashscope-intl.aliyuncs.com`
- **Simple Application Server**: Deployment target
- **Qoder IDE**: Development environment

### Frontend
- Single HTML file (self-contained)
- Pure CSS (no external frameworks)
- Vanilla JavaScript (no libraries)
- Bilingual UI: Indonesian (primary) + English (secondary)

## Architecture

### File Structure
```
/Users/filberthenrico/Peliharan.AI/
├── index.html          # Complete single-page application (1,980 lines)
└── .qoder/
    ├── qoder.md        # This file
    ├── agents/         # Empty
    └── skills/         # Empty
```

### State Management
```javascript
const state = {
  apiKey: '',        // Memory only - NOT persisted per TRD security requirement
  photos: [],        // Base64 encoded images (in-memory only)
  formData: {},      // 16 form fields (in-memory only)
  twinProfile: null, // Generated twin data (in-memory only)
  currentStats: {},  // Dynamic stats (in-memory only)
  conversationHistory: []
};
```

**Important:** ALL data resets on page refresh (by design). API key is NOT stored in localStorage per TRD Section 6.

## Application Flow

1. **Hero** → Landing page with CTA
2. **API Key Input** → Save to localStorage
3. **Photo Upload** → 1-3 photos, drag-drop, base64 conversion
4. **Behavioral Form** → 16 fields about pet personality
5. **Generating** → Loading animation with 4 steps
6. **Twin Profile** → Display generated twin with stats
7. **Interaction Zone** → Feed, Play, Talk, Cuddle, Sleep
8. **Certificate** → Digital Identity Certificate (printable)
9. **Share** → WhatsApp, Instagram, X/Twitter formats

## Core Business Requirements

### BR-01: AI Digital Twin Generation
- Minimum 1 photo required
- Uses Qwen-VL for vision analysis
- Combines photo analysis with 16 behavioral inputs
- Returns JSON twin profile

### BR-02: Interactive Companion (5 Actions)
| Action | Effect |
|--------|--------|
| Feed | Hunger -20, Happiness +15 |
| Play | Energy -15, Mischief +10 (if bored), Happiness +10 |
| Talk | Custom message, Happiness +5 |
| Cuddle | Loyalty +10, Happiness +10 |
| Sleep | Energy +20, Hunger +10 |

All responses use Qwen-Max with personality context.

### BR-03: Digital Identity Certificate
- Twin ID format: `PLH-2026-XX-NNNNN`
- Contains: Owner name, real pet name, twin name, species, date, personality, traits
- Printable with `window.print()`

### BR-04: Qoder + Alibaba Cloud Only
- Single HTML file, no external dependencies
- Only Alibaba Cloud Model Studio APIs
- Deployed on Simple Application Server

## API Integration

### Prompt 1: Twin Generation (Qwen-VL)
```
System: You are Peliharaan AI... respond in valid JSON only
User: [photos + form data] + structured prompt requesting specific JSON format
```

### Prompt 2: Interaction (Qwen-Max)
```
System: You are [twin name] with [personality context]...
User: FEED/PLAY/TALK/CUDDLE/SLEEP: [optional message]
```

## Form Fields (16 Total)

0. Nama Pemilik / Owner Name
1. Nama Peliharaan / Pet Name
2. Jenis / Ras / Species/Breed
3. Tanggal Lahir / Birth Date
4. Jenis Kelamin / Gender
5. 3 Kebiasaan Unik / 3 Unique Habits
6. Jadwal Makan / Feeding Schedule
7. Makanan Favorit / Favorite Food
8. Tempat Favorit / Favorite Spot
9. Level Energi / Energy Level (slider 1-5)
10. Perilaku Sosial / Social Behavior
11. Ketakutan / Benci / Fears
12. Catatan Kesehatan / Health Notes
13. Indoor/Outdoor toggle
14. Ikatan dengan Pemilik / Owner Bond
15. Kepribadian 1 Kata / 1-Word Personality

## Special Features

### Hybrid Fusion Mode
When 3 photos uploaded, system detects potential different pets and prompts Qwen to create a hybrid creature combining all three.

### Ramadan Context
Twin generates personalized Ramadan wishes in the pet's unique voice.

### Stats System
- Cuteness (0-100)
- Energy (0-100)
- Mischief (0-100)
- Wisdom (0-100)
- Loyalty (0-100)
- Hunger (internal, 0-100)
- Happiness (internal, 0-100)

## Deployment

### To Alibaba Cloud Simple Application Server:
1. Upload `index.html` to `/var/www/html/`
2. No build process required
3. No dependencies to install
4. Static file serving only

### Environment Variables (if adding backend later)
- `QWEN_API_KEY`: For backend proxy (currently in localStorage)

## Future Enhancements (Post-Hackathon)

### v2
- GPS Adventure Mode
- Real-time mood decay
- Memorial Mode

### v3
- Pet-to-pet social interaction
- User accounts

### v4
- TBD based on user feedback

## Important Notes for Agents

1. **No Backend Required**: Current architecture is frontend-only calling Alibaba Cloud APIs directly
2. **State is Ephemeral**: Everything resets on refresh except API key
3. **Bilingual by Design**: All UI labels have Indonesian + English
4. **Single File Constraint**: Do not split into multiple files unless explicitly requested
5. **No External Dependencies**: No CDN, no npm packages, no frameworks
6. **API Key in Memory Only**: Per TRD Section 6, API key is NEVER stored in localStorage - user must re-enter on every session

## Common Issues

### CORS
If deploying to custom domain, ensure CORS headers allow requests to `dashscope-intl.aliyuncs.com`

### API Key Security
Current implementation exposes API key in browser (acceptable for hackathon). For production, use backend proxy via Function Compute.

### Image Size
Base64 images can be large. Consider compression if users upload high-res photos.

## Contact
Prepared by: Filbert Henrico
Hackathon: AI x Creativity — Alibaba Cloud & Qoder
Date: March 5, 2026
