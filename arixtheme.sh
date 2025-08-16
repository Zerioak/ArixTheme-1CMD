#!/bin/bash
# ==========================================
# Arix Theme Installer for Pterodactyl Panel
# Made by Zerioak | Join Discord: dcd.gg/ErixySMP
# ==========================================

set -e

echo "=========================================="
echo "     🚀 Installing ArixTheme for Pterodactyl"
echo "     Made by Zerioak | dcd.gg/ErixySMP"
echo "=========================================="
sleep 2

echo ">>> Switching to Pterodactyl directory..."
cd /var/www/pterodactyl

echo ">>> Backing up current panel..."
cp -r /var/www/pterodactyl /var/www/pterodactyl-backup-$(date +%F-%H%M)

echo ">>> Downloading Arix Theme..."
wget -O arix.zip https://github.com/Zerioak/arixtheme/raw/main/arix-themes-1.3.zip

echo ">>> Unzipping theme..."
unzip -o arix.zip -d arix

echo ">>> Copying theme files..."
cp -r arix/* .

echo ">>> Installing dependencies..."
npm install --legacy-peer-deps

echo ">>> Building production assets..."
npm run build:production

echo ">>> Restarting Pterodactyl services..."
systemctl restart pteroq.service
systemctl restart pterodactyl.service

echo ">>> Cleaning up..."
rm -rf arix arix.zip

echo "=========================================="
echo "✅ Arix Theme installed successfully!"
echo "🎉 Credits: Made by Zerioak | dcd.gg/ErixySMP"
echo "=========================================="
