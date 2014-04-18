#!/bin/bash
# Use: $0 <GUEST-NAME> <RULE-NAME> <PORT-GUEST> <PORT-HOST>

# tips: vboxmanage list vms
[ $# -ne 4 ] && echo "Use: $0 <GUEST-NAME> <RULE-NAME> <PORT-GUEST> <PORT-HOST>" && exit 1

GUEST_NAME=$1
RULE_NAME=$2
GUEST_PORT=$3
HOST_PORT=$4

VBoxManage setextradata $GUEST_NAME "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$RULE_NAME/HostPort" $HOST_PORT
VBoxManage setextradata $GUEST_NAME "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$RULE_NAME/GuestPort" $GUEST_PORT
VBoxManage setextradata $GUEST_NAME "VBoxInternal/Devices/pcnet/0/LUN#0/Config/$RULE_NAME/Protocol" TCP
