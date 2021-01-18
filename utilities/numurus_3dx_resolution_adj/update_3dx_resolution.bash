#!/bin/bash

DEV_IP=192.168.179.102

if [ "$1" != "HD2K" -a "$1" != "HD1080" -a "$1" != "HD720" -a "$1" != "VGA" ]; then
    echo -e "Error: argument must be one of\n\tHD2K, HD1080, HD720, or VGA"
    exit 1
fi

RES=$1
scp -i ./device_key ./cfgs/common.yaml.$RES numurus@$DEV_IP:/opt/numurus/ros/share/zed_wrapper/params/common.yaml

if [ $? -ne 0 ]; then
    echo "Error: File transfer failed"
    exit 1
fi

echo -e "\nUpdated resolution to $RES... must reboot device to take effect"
