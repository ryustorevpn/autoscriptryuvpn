#!/bin/bash
# Proxy For Edukasi & Imclass
# My Telegram : https://t.me/geovpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/ascii-home | lolcat
echo "SSH Websocket" | lolcat
echo "Websocket TLS / Websocket None TLS" | lolcat
echo "Progress..." | lolcat
sleep 3
# Link Hosting Kalian
geovpn="autosscript.site/aio/ws"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-tls https://${geovpn}/ws-tls.py
chmod +x /usr/local/bin/ws-tls

# Installing Service
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=Python Proxy Mod By geovpn
Documentation=https://t.me/geovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://${geovpn}/ws-nontls.py
chmod +x /usr/local/bin/ws-nontls

# Installing Service
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By geovpn
Documentation=https://t.me/geovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpn https://${geovpn}/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By geovpn
Documentation=https://t.me/geovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn