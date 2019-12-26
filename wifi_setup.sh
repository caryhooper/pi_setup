#!/bin/bash
echo "Setting up wifi."
r="n"
while [ $r != "y" ] && [ $r != "Y" ];
do
	echo -n "Input the SSID: "
	read ssid
	echo "Is this the correct ESSID? " $ssid " [y/n]"
	read r
done
echo "ESSID is $ssid"

r="n"
while [ $r != "y" ] && [ $r != "Y" ];
do
	echo -n "Input the Wifi Password: "
	read pwd
	echo "Is this the correct Wifi Password? " $pwd " [y/n]"
	read r
done
echo "Wifi Password is $pwd"

file="/etc/network/interfaces"
echo "auto wlan0" >>$file
echo "iface wlan0 inet dhcp" >> $file
echo -e "\twpa-ssid " $ssid >> $file
echo -e "\twpa-psk " $pwd >> $file