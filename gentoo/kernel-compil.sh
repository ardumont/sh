#!/bin/bash

. /sbin/functions.sh

_set(){
	#commande
	MAKE="make"
	MAKE_INSTALL="make install"
	MAKE_MODULES_INSTALL="make modules_install"
	CD="cd"
	#variables
	KERNEL="/usr/src/linux"
	MODULES_REBUILD="/usr/sbin/module-rebuild rebuild"
}

_make(){
	ebegin "compiling the kernel"
	$MAKE
	eend $?
}

_make_modules_install(){
	ebegin "installing the modules of the kernel"
	$MAKE_MODULES_INSTALL
	eend $?
}

_make_install(){
	ebegin "installing the kernel"
	$MAKE_INSTALL
	eend $?
}

_modules_rebuild(){
	ebegin "compiling and installing the external modules"
	$MODULES_REBUILD
	eend $?
}

_set

$CD $KERNEL

_make && _make_modules_install && _make_install && _modules_rebuild && exit 0

exit 1
