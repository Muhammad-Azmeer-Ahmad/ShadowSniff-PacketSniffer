#!/bin/bash
clear
echo -e "\e[1;36m ____  _               _                ____        _  __  __ \e[0m"
echo -e "\e[1;36m/ ___|| |__   __ _  __| | _____      __/ ___| _ __ (_)/ _|/ _|\e[0m"
echo -e "\e[1;36m\___ \| '_ \ / _\` |/ _\` |/ _ \ \ /\ / /\___ \| '_ \| | |_| |_ \e[0m"
echo -e "\e[1;36m ___) | | | | (_| | (_| | (_) \ V  V /  ___) | | | | |  _|  _|\e[0m"
echo -e "\e[1;36m|____/|_| |_|\__,_|\__,_|\___/ \_/\_/  |____/|_| |_|_|_| |_| \e[0m"
echo ""

BLUE='\e[1;34m'
YELLOW='\e[1;33m'
GREEN='\e[1;32m'
RED='\e[1;31m'
RESET='\e[0m'

echo -e "${BLUE}[*] Checking compiled binary...${RESET}"

# Check both existence AND executability — a binary pulled from git
# can exist without the execute bit set, which git does not preserve.
if [ ! -x "./src/a.out" ]; then
    echo -e "${YELLOW}[!] Executable binary not found. Compiling now...${RESET}"
    g++ src/main.cpp src/packet_sniffer.cpp src/protocol_parser.cpp -o src/a.out
    if [ $? -eq 0 ]; then
        chmod +x src/a.out
        echo -e "${GREEN}[+] Compilation successful.${RESET}"
    else
        echo -e "${RED}[X] Compilation failed! Please check for errors in your source code.${RESET}"
        exit 1
    fi
else
    echo -e "${GREEN}[✓] Binary found and executable. Proceeding...${RESET}"
fi

echo ""
echo -e "\e[1;33mDo you want to:\e[0m"
echo -e "\e[1;32m1)\e[0m Start packet sniffing"
echo -e "\e[1;32m2)\e[0m Analyze captured logs"
read -p $'\e[1;33mEnter choice (1 or 2): \e[0m' choice

if [ "$choice" == "1" ]; then
    echo -e "\n\e[1;34m[*] Starting sniffer... Press Ctrl+C to stop.\e[0m\n"
    cd src
    ./a.out
elif [ "$choice" == "2" ]; then
    echo -e "\e[1;34m[*] Running log analyzer...\e[0m"
    cd src
    python3 analyze.py
else
    echo -e "\e[1;31m[!] Invalid choice. Exiting.\e[0m"
fi
