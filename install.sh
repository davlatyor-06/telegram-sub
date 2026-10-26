#!/bin/bash
# ==============================================================================
# Telegram Media Downloader Bot - Avtomatik O'rnatish Skripti (Ubuntu / Debian)
# ==============================================================================

set -e

echo ">>> 1/5. Tizim paketlari yangilanmoqda va kerakli dasturlar o'rnatilmoqda..."
sudo apt update -y
sudo apt install -y python3 python3-pip python3-venv ffmpeg curl

BOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo ">>> Bot papkasi: $BOT_DIR"

echo ">>> 2/5. Python virtual muhiti (venv) yaratilmoqda..."
if [ ! -d "$BOT_DIR/venv" ]; then
    python3 -m venv "$BOT_DIR/venv"
fi

echo ">>> 3/5. Kerakli Python kutubxonalari o'rnatilmoqda..."
"$BOT_DIR/venv/bin/pip" install --upgrade pip
"$BOT_DIR/venv/bin/pip" install -r "$BOT_DIR/requirements.txt"

echo ">>> 4/5. Systemd xizmati sozlanmoqda..."
SERVICE_FILE="/etc/systemd/system/mediabot.service"

sudo bash -c "cat <<EOF > $SERVICE_FILE
[Unit]
Description=Telegram Media Downloader Bot
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$BOT_DIR
ExecStart=$BOT_DIR/venv/bin/python3 bot.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF"

echo ">>> 5/5. Xizmat ishga tushirilmoqda..."
sudo systemctl daemon-reload
sudo systemctl enable mediabot
sudo systemctl restart mediabot

echo "=============================================================================="
echo " TABRIKLAYMIZ! Botingiz serverda 24/7 rejimda muvaffaqiyatli ishga tushdi!"
echo " Holatni ko'rish: sudo systemctl status mediabot"
echo " Loglarni ko'rish: journalctl -u mediabot -f"
echo "=============================================================================="
