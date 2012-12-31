#!/bin/bash

[ -f ~/workspace/projet-wikeo/.metadata/.lock ] && rm ~/workspace/projet-wikeo/.metadata/.lock

HOST=$(hostname)

[ "$HOST" = "job" ] && ECLIPSE=eclipse || ECLIPSE=~/applications/eclipse/eclipse

$ECLIPSE
