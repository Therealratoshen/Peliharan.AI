# Peliharaan AI

**Hewan peliharaanmu, hidup di dunia digital**  
*Your real pet. Digitally alive.*

[![Hackathon](https://img.shields.io/badge/Hackathon-AI%20x%20Creativity-orange)](https://)
[![Platform](https://img.shields.io/badge/Platform-Alibaba%20Cloud-blue)](https://www.alibabacloud.com)
[![AI](https://img.shields.io/badge/AI-Qwen%20VL%20%2B%20Qwen%20Max-green)](https://)

---

## 🎯 What is Peliharaan AI?

Peliharaan AI is Indonesia's first AI-powered digital pet twin platform. Upload 1-3 real photos of your pet, answer a short behavioral questionnaire, and our AI generates a living digital companion that thinks, talks, and reacts exactly like your actual animal.

Unlike Tamagotchi or Neopets which create fictional virtual pets, Peliharaan AI creates a digital extension of a pet the owner already loves.

---

## ✨ Features

### Core Features
- 📸 **Photo Upload** - Upload 1-3 pet photos (drag-drop or click)
- 📝 **Behavioral Form** - 16-field questionnaire about your pet's personality
- 🤖 **AI Twin Generation** - Qwen-VL analyzes photos + form to create unique twin
- 💬 **Interactive Companion** - 5 interaction types (Feed, Play, Talk, Cuddle, Sleep)
- 📜 **Digital Certificate** - Unique PLH-2026-XX-NNNNN identity certificate
- 📱 **Social Sharing** - Shareable cards for WhatsApp, Instagram, X

### Special Modes
- ⚡ **Hybrid Fusion** - Upload 3 different pets to create a hybrid creature
- 🌙 **Ramadan Wishes** - Personalized blessings in your pet's unique voice

---

## 🏗️ Architecture

### Tech Stack
| Layer | Technology |
|-------|------------|
| Frontend | HTML5 + CSS3 + Vanilla JS (ES2022) |
| AI Vision | Alibaba Cloud qwen-vl-max |
| AI Text | Alibaba Cloud qwen-max |
| API Gateway | DashScope International |
| Web Server | Nginx 1.24+ |
| Hosting | Alibaba Cloud Simple Application Server |

### Single-File Architecture
```
Peliharan.AI/
├── index.html          # Complete application (2,091 lines)
├── .qoder/
│   └── qoder.md        # Agent knowledge base
└── README.md           # This file
```

**No build process. No dependencies. Just upload and run.**

---

## 🚀 Quick Start

### Prerequisites
- Alibaba Cloud Model Studio API Key ([Get one here](https://dashscope-intl.aliyuncs.com))
- Modern web browser
- 1-3 photos of your pet

### Local Development
```bash
# Clone repository
git clone https://github.com/Therealratoshen/Peliharan.AI.git
cd Peliharan.AI

# Open in browser
open index.html
```

### Deployment (Alibaba Cloud SAS)
```bash
# SSH into your Simple Application Server
ssh root@YOUR_SERVER_IP

# Install Nginx
sudo apt update && sudo apt install nginx -y
sudo systemctl start nginx && sudo systemctl enable nginx

# Upload index.html to web root
sudo cp index.html /var/www/html/
sudo nginx -t && sudo systemctl reload nginx

# Access your app
open http://YOUR_SERVER_IP
```

---

## 📋 Application Flow

| Step | Section | Description |
|------|---------|-------------|
| 1 | **Hero** | Landing page with CTA |
| 2 | **API Key** | Enter Alibaba Cloud API key |
| 3 | **Photo Upload** | Upload 1-3 pet photos |
| 4 | **Behavioral Form** | Answer 16 questions about your pet |
| 5 | **Generating** | AI analyzes and creates twin |
| 6 | **Twin Profile** | View your digital pet twin |
| 7 | **Interaction Zone** | Feed, Play, Talk, Cuddle, Sleep |
| 8 | **Certificate** | Download digital identity certificate |
| 9 | **Share** | Share on social media |

---

## 🤖 AI Integration

### Prompt 1: Twin Generation (Qwen-VL)
Analyzes pet photos + behavioral data to generate:
- Twin name and species title
- Backstory and personality type
- 5 stats (Cuteness, Energy, Mischief, Wisdom, Loyalty)
- Special ability and weaknesses
- First words and Ramadan wish

### Prompt 2: Interaction Response (Qwen-Max)
Responds to user actions in the pet's unique voice:
- Context-aware responses based on mood/stats
- Personality-consistent communication style
- Dynamic stat changes

---

## 🔒 Security

- ✅ API key stored in **memory only** (never in localStorage)
- ✅ All photo processing is **client-side** (base64)
- ✅ No user data persisted on servers
- ✅ HTTPS recommended for production

---

## 🎨 Design

- **Language:** Bilingual UI (Indonesian primary, English secondary)
- **Colors:** Warm coral (#FF6B6B), soft cream (#FFF5E6), teal accent (#4ECDC4)
- **Responsive:** Mobile-first, works on all devices
- **Animations:** Smooth transitions, loading states

---

## 📊 Performance Targets

| Operation | Target | Maximum |
|-----------|--------|---------|
| Page load | < 2s | < 4s |
| Photo upload | < 1s | < 2s |
| Form completion | 2-3 min | 10 min |
| Twin generation | < 10s | < 20s |
| Interaction response | < 5s | < 10s |

---

## 🧪 Testing

### Diagnostic Mode
Press `Ctrl+Shift+D` to run diagnostics:
- API key validation
- Photo upload status
- Form data check
- API connectivity test
- DOM element verification

### Manual Testing Checklist
- [ ] Upload 1-3 photos
- [ ] Fill all 16 form fields
- [ ] Generate twin (wait for 4 steps)
- [ ] Test all 5 interactions
- [ ] View and print certificate
- [ ] Copy share text
- [ ] Test error handling (invalid API key, timeout)

---

## 🚧 Constraints

Per hackathon requirements:
- Alibaba Cloud Model Studio **only** (Qwen models)
- Alibaba Cloud Simple Application Server **only**
- Qoder IDE **only**
- Single HTML file format
- No external APIs beyond Alibaba Cloud/Qoder
- Indonesian + English bilingual UI

---

## 🗺️ Roadmap

### MVP (Current)
- ✅ All core features
- ✅ AI twin generation
- ✅ 5 interaction types
- ✅ Certificate & sharing

### v2 (Post-Hackathon)
- GPS Adventure Mode
- Real-time mood decay
- Memorial Mode

### v3
- Pet-to-pet social interaction
- User accounts

### v4
- TBD based on user feedback

---

## 👨‍💻 Developer

**Filbert Henrico**  
Hackathon: AI x Creativity — Alibaba Cloud & Qoder  
Date: March 5, 2026

---

## 📄 License

This project was created for the AI x Creativity Hackathon. All rights reserved.

---

## 🙏 Acknowledgments

- Alibaba Cloud for providing the AI infrastructure
- Qoder IDE for the development platform
- Qwen models for making digital pet twins possible

---

**[⬆ Back to Top](#peliharaan-ai)**
