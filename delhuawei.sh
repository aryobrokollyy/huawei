#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin
CONF=/etc/config
MODEL=/usr/lib/lua/luci/model/cbi
CON=/usr/lib/lua/luci/controller


finish(){
clear
    echo ""
    echo "UN-INSTALL HUAWEI MONITOR SUCCESSFULLY ;)"
    echo ""
    sleep 3
    echo "Youtube : ARYO BROKOLLY"
    echo ""
    sleep 5
    echo ""
}

uninstall_files()
{		

	echo "deleting file huawei monitor..."
    	clear
        rm -f $DIR/huawei.py
        mv $DIR/huawei_x.py $DIR/huawei.py
	sleep 1
	rm -f $MODEL/huawey.lua
	clear
	sleep 1
	rm -f $DIR/huawei
	clear
	sleep 1
	rm -f $CONF/huawey
        clear
        sleep 1
  	rm -f $CON/huawey.lua
 	finish
}


echo ""

echo ""

while true; do
    read -p "This will delete huawei monitor. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) uninstall_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
