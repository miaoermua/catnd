#!/bin/bash
###
 # @Author: 喵二
 # @Date: 2023-09-22 09:19:42
 # @LastEditors: 喵二
 # @LastEditTime: 2023-09-22 12:45:30
 # @FilePath: \undefinedd:\Git\catnd\check.sh
### 

echo "$(date) - Starting CatWrt-network-diagnostics"  

# Ping & PPPoE

ping -c 3 223.5.5.5 > /dev/null
if [ $? -eq 0 ]; then
    echo "[Ping] Network connection succeeded"
else
    ping -c 3 119.29.29.99 > /dev/null
    if [ $? -eq 0 ]; then
        echo "[Ping] Network connection succeeded"
    else
        pppoe_config=$(grep 'pppoe' /etc/config/network)
        if [ ! -z "$pppoe_config" ]; then
            echo "[PPPoE] Please check if your PPPoE account and password are correct."
        fi
        exit 1
    fi
fi

# DNS

valid_dns="1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 223.6.6.6 223.5.5.5 180.76.76.76 208.67.222.222 208.67.220.220 119.29.29.99"

dns_config=$(grep 'option dns' /etc/config/network)
dns_servers=$(echo $dns_config | awk -F "'" '{print $2}')

for ip in $dns_servers; do
  if ! [[ $valid_dns =~ (^|[ ])$ip($|[ ]) ]]; then
    echo "Invalid DNS IP: $ip"
    exit 1
  fi
done

# 是否存在坏逼 DNS

echo "[DNS] DNS configuration looks good"

bad_dns="114.114.114.114 114.114.115.115 119.29.29.29"
if [[ $dns_config =~ $bad_dns ]]; then
  echo "[DNS] DNS may be polluted or unreliable"
fi

# nslookup

nslookup bilibili.com > /dev/null
if [ $? -ne 0 ]; then
  nslookup www.miaoer.xyz > /dev/null
  if [ $? -eq 0 ]; then  
    echo "[DNS] DNS resolution succeeded"
  else
    echo "[DNS] NS resolution failed for www.miaoer.xyz"
    echo "[DNS] Your DNS server may have issues"
  fi
fi

# Default-IP

ipaddr_config=$(grep 'option ipaddr' /etc/config/network)
if [ "$ipaddr_config" != "option ipaddr '192.168.1.4'" ]; then
  echo "[Default-IP] address is not the catwrt default 192.168.1.4"
  echo "Please configure your network at 'https://www.miaoer.xyz/posts/network/quickstart-catwrt'"
fi

# Bypass gateway

wan_config=$(grep 'config interface' /etc/config/network | grep 'wan')

if [ -z "$wan_config" ]; then
  echo "[bypass gateway] No config for 'wan' interface found in /etc/config/network"
  echo "Please check if your device is set as a bypass gateway"
fi

# CatWrt PPPoE

wan_config=$(grep 'config interface' /etc/config/network | grep 'wan')

if [ ! -z "$wan_config" ]; then

  has_dhcp=$(grep 'option proto' $wan_config | grep 'dhcp')

  if [ ! -z "$has_dhcp" ]; then
    echo "[PPPoE] DHCP protocol detected in WAN interface"
    echo "The device may not be in PPPoE gateway mode"
  fi

fi

# IPv6 WAN6

grep 'config interface' /etc/config/network | grep 'wan6'
if [ $? -ne 0 ]; then
  echo "Your IPv6 network may have issues"
fi

grep 'proto 'dhcpv6'' /etc/config/network  
if [ $? -ne 0 ]; then
  echo "Your IPv6 network may have issues"
fi

echo "$(date) - Network check completed"
echo "CatWrt-network-diagnostics by @miaoermua"