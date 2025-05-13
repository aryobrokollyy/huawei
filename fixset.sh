#!/bin/ash
# Installation script by ARYO.

CON=/usr/lib/lua/luci/controller/fixttl
VIEW=/usr/lib/lua/luci/view/fixttl
URL=https://raw.githubusercontent.com/aryobrokollyy/fixttlwrt/main


finish(){
    clear
    echo ""
    echo "INSTALL FIX SUCCESSFULLY ;)"
    echo ""
    echo "=========== FIX TTL65 - ARYO  ==========="
    echo "huawei -u : Update Fix TTL service"
    echo "huawei -un : Uninstall Fix TTL service"
    echo ""
    sleep 3
    echo "Youtube : ARYO BROKOLLY"
    echo ""
    sleep 5
    echo ""
}

download_files() {
    clear
    opkg update
    clear

    echo "Install Fix TTL 65.."
    sleep 3
    clear
    mkdir -p $CON
    sleep 1
    wget -O $CON/ttl.lua $URL/ttl.lua chmod +x $CON/ttl.lua
    clear
    sleep 1
    mkdir -p $VIEW/page.htm $URL/page.htm chmod +x $VIEW/ttl.lua
    sleep 1
    clear
    
    finish
}


echo ""
echo "Install Script code from repo aryo."

while true; do
    read -p "This will download the files. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) echo "Installation canceled. Ensure you have a stable internet connection before retrying."; exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
