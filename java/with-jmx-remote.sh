#!/usr/bin/env bash

$* -Djava.rmi.server.hostname=$(hostname) -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=6666 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false
