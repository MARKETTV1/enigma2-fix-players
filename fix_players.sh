#!/bin/sh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
RESET='\033[0m'

clear

echo ""
printf "${CYAN}╔══════════════════════════════════════════════════════╗${RESET}\n"
printf "${CYAN}║${RESET}                                                      ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}  ${WHITE} ███████╗███╗   ██╗██╗ ██████╗ ███╗   ███╗ █████╗ ${RESET} ${CYAN} ║${RESET}\n"
printf "${CYAN}║${RESET}  ${WHITE} ██╔════╝████╗  ██║██║██╔════╝ ████╗ ████║██╔══██╗${RESET} ${CYAN} ║${RESET}\n"
printf "${CYAN}║${RESET}  ${CYAN} █████╗  ██╔██╗ ██║██║██║  ███╗██╔████╔██║███████║${RESET} ${CYAN}  ║${RESET}\n"
printf "${CYAN}║${RESET}  ${CYAN} ██╔══╝  ██║╚██╗██║██║██║   ██║██║╚██╔╝██║██╔══██║${RESET} ${CYAN}  ║${RESET}\n"
printf "${CYAN}║${RESET}  ${PURPLE} ███████╗██║ ╚████║██║╚██████╔╝██║ ╚═╝ ██║██║  ██║${RESET} ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}  ${PURPLE} ╚══════╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝${RESET} ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}                                                      ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}        ${YELLOW}Fix Players Script  —  fix_players.sh${RESET}        ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}                                                      ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}              ${GREEN}By : KARIM ABU RIDA${RESET}                     ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}         ${WHITE}Install Enigma2 Media Players${RESET}                ${CYAN}║${RESET}\n"
printf "${CYAN}║${RESET}                                                      ${CYAN}║${RESET}\n"
printf "${CYAN}╚══════════════════════════════════════════════════════╝${RESET}\n"
echo ""

sleep 2

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
sleep 5

echo ""
echo "[6/8] Installing exteplayer3..."
opkg install exteplayer3
sleep 5

echo ""
echo "[7/8] Installing serviceapp..."
opkg install enigma2-plugin-systemplugins-serviceapp
sleep 5

echo ""
echo "[8/8] Reinstalling gstplayer..."
opkg remove gstplayer
opkg install gstplayer

echo ""
printf "${GREEN}╔══════════════════════════════════════╗${RESET}\n"
printf "${GREEN}║   Done Successfully!  ✔               ║${RESET}\n"
printf "${GREEN}╚══════════════════════════════════════╝${RESET}\n"
echo ""
