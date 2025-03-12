#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin
CONF=/etc/config
MODEL=/usr/lib/lua/luci/model/cbi
CON=/usr/lib/lua/luci/controller
URL=https://raw.githubusercontent.com/saputribosen/1clickhuawei/main

retry_download() {
    local file_path=$1
    local url=$2
    local max_retries=5
    local attempt=1

    while [ $attempt -le $max_retries ]; do
        wget -O "$file_path" "$url"
        if [ -s "$file_path" ]; then
            echo "Download successful: $file_path"
            return 0
        else
            echo "Download failed or file size 0 KB. Retrying ($attempt/$max_retries)..."
            rm -f "$file_path"
            attempt=$((attempt + 1))
            sleep 2
        fi
    done

    echo "Failed to download $file_path after $max_retries attempts."
    echo "Check your internet connection and try again. Exiting."
    exit 1
}

install_update(){
    echo "Update and install prerequisites"
    clear
    opkg update
    sleep 1
    clear
    opkg install python3-pip
    sleep 1
    clear
    pip3 install requests
    sleep 1
    clear
    pip3 install huawei-lte-api
    sleep 1
    clear
    pip install asyncio
    sleep 1
    clear
    pip install python-telegram-bot
    sleep 1
    clear
    pip install huawei-lte-api
    sleep 1
    clear
    pip install requests
    sleep 1
    clear
    opkg install git
    sleep 1
    clear
    opkg install git-http
    sleep 1
    clear
}

finish(){
    clear
    echo ""
    echo "INSTALL SUCCESSFULLY ;)"
    echo ""
    echo "=========== HUAWEI MONITOR ==========="
    echo "huawei -r : Run Huawei Monitor service"
    echo "huawei -s : Stop Huawei Monitor service"
    echo "huawei -u : Update Huawei Monitor service"
    echo "huawei -x : Uninstall Huawei Monitor service"
    echo ""
    sleep 3
    echo "Youtube : ARYO BROKOLLY"
    echo ""
    sleep 5
    echo ""
}

download_files() {
    clear
    mv $DIR/huawei.py $DIR/huawei_x.py
    sleep 3
    echo "Downloading files from repo.."
    
    retry_download "$MODEL/huawey.lua" "$URL/cbi_model/huawey.lua"
    retry_download "$DIR/huawei.py" "$URL/huawei.py"
    chmod +x "$DIR/huawei.py"
    
    retry_download "$DIR/huawei" "$URL/huawei.sh"
    chmod +x "$DIR/huawei"
    
    retry_download "$CONF/huawey" "$URL/huawey"
    retry_download "$CON/huawey.lua" "$URL/controller/huawey.lua"
    chmod +x "$CON/huawey.lua"
    
    finish
}

echo ""
echo "Install prerequisites."
read -p "Do you want to install prerequisites (y/n)? " yn
case $yn in
    [Yy]* ) install_update;;
    [Nn]* ) echo "Skipping prerequisites installation...";;
    * ) echo "Invalid input. Skipping prerequisites installation...";;
esac

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
