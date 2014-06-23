#!/bin/bash

HOST=$(hostname)

[ "$HOST" = "job" ] && ECLIPSE=eclipse || ECLIPSE=~/applications/eclipse/eclipse

$ECLIPSE
