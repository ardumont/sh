#!/bin/sh

[ $# -ne 2 ] && echo "Use: $0 <SERVER> <PORT>" && exit 1

SERVER=$1
PORT=$2

(openssl s_client -connect $SERVER:$PORT </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p') 2>/dev/null
