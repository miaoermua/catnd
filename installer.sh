# Check OpenWrt
###
 # @Author: 喵二
 # @Date: 2023-09-30 18:34:35
 # @LastEditors: 喵二
 # @LastEditTime: 2023-09-30 18:44:15
 # @FilePath: \catnd\installer.sh
### 

if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root user"
    exit 1
fi

release=$(cat /etc/openwrt_release)

if [[ $release =~ "OpenWrt" ]]; then
  echo "$(date) - Starting CatWrt Network Diagnostics"  
else
  echo "Abnormal system environment..."
  echo " "
  exit 1
fi

curl -o /usr/bin/catnd https://fastly.jsdelivr.net/gh/miaoermua/catnd@main/catnd.sh

chmod +x /usr/bin/catnd

echo "Installation successful!"

echo "Type 'catnd' to use the CatWrt-network-diagnostics script!"