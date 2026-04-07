#!/bin/sh

echo "===================================="
echo "  إعادة تثبيت مشغلات Enigma2"
echo "===================================="

echo ""
echo "[1/8] تحديث قائمة الحزم..."
opkg update

echo ""
echo "[2/8] حذف serviceapp..."
opkg remove enigma2-plugin-systemplugins-serviceapp

echo ""
echo "[3/8] حذف exteplayer3..."
opkg remove exteplayer3

echo ""
echo "[4/8] حذف ffmpeg..."
opkg remove ffmpeg

echo ""
echo "[5/8] تثبيت ffmpeg..."
opkg install ffmpeg

echo ""
echo "[6/8] تثبيت exteplayer3..."
opkg install exteplayer3

echo ""
echo "[7/8] تثبيت serviceapp..."
opkg install enigma2-plugin-systemplugins-serviceapp

echo ""
echo "[8/8] إعادة تثبيت gstplayer..."
opkg remove gstplayer
opkg install gstplayer

echo ""
echo "===================================="
echo "  تمت العملية بنجاح! ✔"
echo "===================================="
