#!/bin/sh

[ $# -ne 1 ] && echo "Use: $0 <PRIVATE-KEY-ID>
Output the public key's content for the given <PRIVATE-KEY-ID>.
PRIVATE-KEY-ID your private key identifier" && return 1

PRIVATE_KEY_ID=$1

gpg2 --armor --export $PRIVATE_KEY_ID
