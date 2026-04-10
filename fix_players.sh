#!/bin/sh

echo "===================================="
echo "  Enigma2 Players Reinstall"
echo "===================================="

echo ""
echo "[1/8] Updating package list..."
opkg update

echo ""
echo "[2/8] Removing serviceapp..."
opkg remove enigma2-plugin-systemplugins-serviceapp

echo ""
echo "[3/8] Removing exteplayer3..."
opkg remove exteplayer3

echo ""
echo "[4/8] Removing ffmpeg..."
opkg remove ffmpeg --force-depends

echo ""
echo "[5/8] Installing ffmpeg..."
opkg install ffmpeg

echo ""
echo "[6/8] Installing exteplayer3..."
opkg install exteplayer3

echo ""
echo "[7/8] Installing serviceapp..."
opkg install enigma2-plugin-systemplugins-serviceapp

echo ""
echo "[8/8] Reinstalling gstplayer..."
opkg remove gstplayer
opkg install gstplayer

echo ""
echo "===================================="
echo "  Done successfully! ✔"
echo "===================================="
