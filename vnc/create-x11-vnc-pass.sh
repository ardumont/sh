#!/usr/bin/env bash

PASS=$1

x11vnc -storepasswd $PASS ~/.vnc/passwd
