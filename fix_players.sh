#!/bin/sh

set -e

LOG="/tmp/reinstall_players.log"
exec > "$LOG" 2>&1

echo "===================================="
echo "  Enigma2 Players Reinstall"
echo "===================================="

# التحقق من الاتصال بالإنترنت
echo ""
echo "Checking internet connection..."
if ! ping -c 1 google.com > /dev/null 2>&1; then
    echo "❌ No internet connection! Exiting."
    exit 1
fi
echo "✔ Internet connection OK"

echo ""
echo "[1/8] Updating package list..."
opkg update || { echo "❌ Failed to update packages!"; exit 1; }

echo ""
echo "[2/8] Removing serviceapp..."
opkg remove enigma2-plugin-systemplugins-serviceapp || true

echo ""
echo "[3/8] Removing exteplayer3..."
opkg remove exteplayer3 || true

echo ""
echo "[4/8] Removing ffmpeg..."
opkg remove ffmpeg --force-depends || true

echo ""
echo "[5/8] Installing ffmpeg..."
opkg install ffmpeg || { echo "❌ Failed to install ffmpeg!"; exit 1; }

echo ""
echo "[6/8] Installing exteplayer3..."
opkg install exteplayer3 || { echo "❌ Failed to install exteplayer3!"; exit 1; }

echo ""
echo "[7/8] Installing serviceapp..."
opkg install enigma2-plugin-systemplugins-serviceapp || { echo "❌ Failed to install serviceapp!"; exit 1; }

echo ""
echo "[8/8] Reinstalling gstplayer..."
opkg remove gstplayer || true
opkg install gstplayer || { echo "❌ Failed to install gstplayer!"; exit 1; }

echo ""
echo "===================================="
echo "  Done successfully! ✔"
echo "  Log saved to: $LOG"
echo "===================================="

# إعادة تشغيل Enigma2 لتطبيق التغييرات
echo ""
echo "Restarting Enigma2..."
sleep 2
killall -9 enigma2
