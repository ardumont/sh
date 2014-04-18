#!/bin/bash
# Use: $0 <GUEST-NAME> <RULE-NAME> <PORT-GUEST> <PORT-HOST>

# tips: vboxmanage list vms
[ $# -ne 4 ] && echo "Use: $0 <GUEST-NAME> <RULE-NAME> <PORT-GUEST> <PORT-HOST>" && exit 1

GUEST_NAME=$1
RULE_NAME=$2
GUEST_PORT=$3
HOST_PORT=$4
PROTOCOL=tcp

# Pause the vm to be able to modify it
VBoxManage controlvm $GUEST_NAME pause

# Remove if the rules exist
VBoxManage modifyvm $GUEST_NAME --natpf1 delete "$RULE_NAME"
# Than add the current rule
VBoxManage modifyvm $GUEST_NAME --natpf1 "$RULE_NAME,$PROTOCOL,,$HOST_PORT,,$GUEST_NAME"

# Pause the vm to be able to modify it
VBoxManage controlvm $GUEST_NAME resume
