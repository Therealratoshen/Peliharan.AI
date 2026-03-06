#!/bin/bash
# Peliharaan AI Deployment Script
# Usage: ./deploy.sh YOUR_SERVER_IP

set -e

SERVER_IP=$1

if [ -z "$SERVER_IP" ]; then
    echo "Usage: ./deploy.sh YOUR_SERVER_IP"
    echo "Example: ./deploy.sh 47.74.123.45"
    exit 1
fi

echo "🚀 Deploying Peliharaan AI to Alibaba Cloud SAS..."
echo "Server IP: $SERVER_IP"
echo ""

# Check if index.html exists
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found in current directory"
    exit 1
fi

echo "📦 Step 1: Installing Nginx on server..."
ssh root@$SERVER_IP << 'EOF'
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
EOF

echo ""
echo "📤 Step 2: Uploading index.html..."
scp index.html root@$SERVER_IP:/var/www/html/

echo ""
echo "🔧 Step 3: Configuring Nginx..."
ssh root@$SERVER_IP << 'EOF'
    # Set proper permissions
    chown www-data:www-data /var/www/html/index.html
    chmod 644 /var/www/html/index.html
    
    # Test Nginx configuration
    nginx -t
    
    # Reload Nginx
    systemctl reload nginx
    
    echo "✅ Nginx configured successfully"
EOF

echo ""
echo "✨ Deployment complete!"
echo ""
echo "🌐 Your Peliharaan AI is live at:"
echo "   http://$SERVER_IP"
echo ""
echo "📋 Next steps:"
echo "   1. Open http://$SERVER_IP in your browser"
echo "   2. Enter your Alibaba Cloud API key"
echo "   3. Upload pet photos and create your digital twin!"
echo ""
echo "🔒 Security note: Consider setting up HTTPS with Let's Encrypt"
echo "   sudo apt install certbot python3-certbot-nginx"
echo "   sudo certbot --nginx -d yourdomain.com"
