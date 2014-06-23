#!/bin/bash

HOST=$(hostname)

[ "$HOST" = "job" ] && ECLIPSE=eclipse || ECLIPSE=~/applications/ide/eclipse/eclipse/eclipse

$ECLIPSE
