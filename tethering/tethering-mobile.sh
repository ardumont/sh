#!/system/bin/sh

CONN=usb0

MOBILE_IP=10.42.0.2
GW_IP=10.42.0.1

ifconfig $CONN

ifconfig $CONN $MOBILE_IP netmask 255.255.255.0

route add default gw $GW_IP dev $CONN

ifconfig $CONN
