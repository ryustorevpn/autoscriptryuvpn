#!/bin/bash
# Menu For Script
# Edition : Stable Edition V1.0
# Author  : MAULANA ADITYA
# (C) Copyright 2022-2023 By RYUSTOREVPN
# =========================================

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="FsidVPN"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )

# // Exporting RED BG
export RED_BG='\e[44m'
# ==========================================
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################
clear
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED_BG}                 VPS / Sytem Information                  ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "Sever Uptime        = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    = $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Total Amount RAM    = $tram MB"
echo -e "Current Domain      = $( cat /etc/xray/domain )"
echo -e "Server IP           = ${IP}"

echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " [ SSH WebSocket${NC} : ${status_ws} ]   [ XRAY${NC} : ${status_xray} ]   [ NGINX${NC} : ${status_nginx} ]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "[${GREEN}01${NC}]${RED} •${NC} Add User SSH$NC         [${GREEN}10${NC}]${RED} • ${NC}Cek Usage"
echo -e "[${GREEN}02${NC}]${RED} •${NC} SSH WS Enable$NC        [${GREEN}11${NC}]${RED} • ${NC}Cek User Xray $NC"
echo -e "[${GREEN}03${NC}]${RED} •${NC} Cek User SSH$NC         [${GREEN}12${NC}]${RED} • ${NC}Del User Xray $NC"
echo -e "[${GREEN}04${NC}]${RED} •${NC} Del User SSH$NC         [${GREEN}13${NC}]${RED} • ${NC}Renew User Xray $NC"
echo -e "[${GREEN}05${NC}]${RED} •${NC} Renew SSH $NC           [${GREEN}14${NC}]${RED} • ${NC}Add-host $NC"
echo -e "[${GREEN}06${NC}]${RED} •${NC} Member SSH $NC          [${GREEN}15${NC}]${RED} • ${NC}Cert V2ray $NC"
echo -e "[${GREEN}07${NC}]${RED} •${NC} Add Vmess Account $NC   [${GREEN}16${NC}]${RED} • ${NC}Backup $NC"
echo -e "[${GREEN}08${NC}]${RED} •${NC} Add Vless Account$NC    [${GREEN}17${NC}]${RED} • ${NC}Restore $NC"
echo -e "[${GREEN}09${NC}]${RED} •${NC} Addd Trojan Account$NC  [${GREEN}18${NC}]${RED} • ${NC}Running $NC"
echo -e " ${RED}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED_BG}                      RyuStoreVPN PROJECT                         ${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}CLIENT NAME${NC}    ${RED}•$NC $Name"
echo -e "${GREEN}SCRIPT EXPIRED${NC} ${RED}•$NC $exp"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
#echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

read -p "Input Your Choose ( 1-18 ) : " choosemu


case $choosemu in
    1) # >> SSH Manager
        addssh
    ;;
    2) # >> Vmess Manager
        sshws
    ;;

    # Restarting
    3) # >> Restart SSH
        cek
    ;;
    4) # >> ALL Service
        hapus
    ;;
    5) # >> ALL Service
        renew
    ;;
    6) # >> Speedtest
        member
    ;;
    7) # >> Ram Usage
        addws
    ;;
    8) # >> Bandiwdth usage
        clear
        addvless
    ;;
    9) # >> Change Timezone
        addtr
    ;;
    10) # // Change License
        cekusage
    ;;
    11) # >> Change domain
        cekws
    ;;
    12) # // Renew SSL Cert
        delws
    ;;
    13) # // Add mail
        renewws
    ;;
    14) # // Backup
        addhost
    ;;
    15) # // Restore
        crtv2ray
    ;;
    16) # // Create SSL For Stunnel
        bckp
    ;;
    17) # // OpenVPN
        restore
    ;;
    18) # // OpenVPN
        running
    ;;
    *) # >> Wrong Select
        echo -e "${EROR} SALAH SAYANG !!!"
        sleep 1
        menu
    ;;
esac
