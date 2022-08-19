#!/bin/bash
# Welcome Information
# Edition : Stable Edition V1.0
# Auther  : ADIT ARDIANSYAH
# (C) Copyright 2021-2022 By Geo Project
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
#export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="Geo"
export RED_BG='\e[41m'

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )

function os_detail () {
    OS_Name="$( cat /etc/os-release | grep -w ID | head -n1 | sed 's/ID//g' | sed 's/=//g' )"
    OS_FName="$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' | sed 's/,//g'  )"
    OS_Version="$( cat /etc/os-release | grep -w VERSION | head -n1 | sed 's/VERSION//g' | sed 's/=//g' | sed 's/"//g' )"
    OS_Version_ID="$( cat /etc/os-release | grep -w VERSION_ID | head -n1 | sed 's/VERSION_ID//g' | sed 's/=//g' | sed 's/"//g' )"
    OS_Arch="$( uname -m )"
    OS_Kernel="$( uname -r )"
}
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		geo="\033[1;31mExpired\033[0m"
        else
        geo=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
# GETTING INFORMATION
# =========================================================================================================
# // OpenSSH
openssh=$( systemctl status ssh | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $openssh == "running" ]]; then
    status_openssh="${GREEN}Running${NC} ( No Eror )"
else
    status_openssh="${RED}No Running${NC} ( Eror )"
fi

# // Stunnel5
stunnel5=$( systemctl status stunnel4 | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stunnel5 == "running" ]]; then
    status_stunnel5="${GREEN}Running${NC} ( No Eror )"
else
    status_stunnel5="${RED}No Running${NC} ( Eror )"
fi

# // Dropbear
dropbear=$( systemctl status dropbear | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $dropbear == "running" ]]; then
    status_dropbear="${GREEN}Running${NC} ( No Eror )"
else
    status_dropbear="${RED}No Running${NC} ( Eror )"
fi

# // Squid
squid=$( systemctl status squid | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $squid == "running" ]]; then
    status_squid="${GREEN}Running${NC} ( No Eror )"
else
    status_squid="${RED}No Running${NC} ( Eror )"
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-nontls | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}Running${NC} ( No Eror )"
else
    status_ws_epro="${RED}No Running${NC} ( Eror )"
fi

# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}Running${NC} ( No Eror )"
else
    status_ss="${RED}No Running${NC} ( Eror )"
fi

# // NGINX
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}Running${NC} ( No Eror )"
else
    status_nginx="${RED}No Running${NC} ( Eror )"
fi

# =========================================================================================================

# // Running Function Requirement
os_detail
script_version
license_check

if [[ $Bot == "1" ]]; then
        bot='Allowed'
else
        bot='Not Allowed'
fi

if [[ $Beta == "1" ]]; then
        beta='Allowed'
else
        beta='Not Allowed'
fi

if [[ $Backup == "1" ]]; then
        backup='Allowed'
else
        backup='Not Allowed'
fi

# // Clear
clear
clear && clear && clear
clear;clear;clear

echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "                ${YELLOW}(${NC}${GREEN} STATUS SERVICE INFORMATION ${NC}${YELLOW})${NC}"
echo -e "         OWNER : ${GREEN}ADIT ARDIANSYAH ${NC}${YELLOW}(${NC} ${GREEN}Geo Project ${NC}${YELLOW})${NC}"
echo -e "       © Copyright Geo Project ${YELLOW}(${NC} 2021-2022 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""
echo -e "${RED_BG}                     Sytem Information                    ${NC}"
echo -e "Sever Uptime        = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Script Version      = 3.1"
echo -e "Operating System    = ${OS_FName} ( ${OS_Arch} )"
echo -e "Total Amount RAM    = $tram MB"
echo -e "Current Domain      = $( cat /etc/xray/domain )"
echo -e "Server IP           = ${IP}"
echo -e "Client Name         = $Name"
echo -e "Exp Script          = $geo"
echo ""
echo -e "${RED_BG}                     Service Information                  ${NC}"
echo -e ""
echo -e "OpenSSH             = $status_openssh"
echo -e "Dropbear            = $status_dropbear"
echo -e "Stunnel4            = $status_stunnel5"
echo -e "Squid               = $status_squid"
#echo -e "BadVPN 7100         = $status_badvpn1"
#echo -e "BadVPN 7200         = $status_badvpn2"
#echo -e "BadVPN 7300         = $status_badvpn3"
#echo -e "OHP OpenSSH         = $status_ohp1"
#echo -e "OHP Dropbear        = $status_ohp2"
#echo -e "OHP Universal       = $status_ohp4"
echo -e "NGINX               = $status_nginx"
#echo -e "SSLH                = $status_sslh"
echo -e "SSH NonTLS          = $status_ws_epro"
echo -e "SSH TLS             = $status_ws_epro"
echo -e "Vmess WS/GRPC       = $status_ss"
echo -e "Vless WS/GRPC       = $status_ss"
echo -e "Trojan WS/GRPC      = $status_ss"
#echo -e "Shadowsocks WS/GRPC = $status_ss"
echo -e ""
echo -e "${RED_BG}                         Geo Project                      ${NC}"
echo ""
echo -e "${GREEN}Please Type Menu${NC}"