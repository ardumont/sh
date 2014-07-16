#!/usr/bin/env bash

#Use; Run as root

# to use with edbi https://github.com/kiwanami/emacs-edbi

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib:$LD_LIBRARY_PATH
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export PATH=$ORACLE_HOME/bin:$PATH

cpan RPC::EPC::Service
cpan DBD::Oracle
