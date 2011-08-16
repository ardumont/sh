#!/bin/bash

_set(){
	#commande
	VBOX=/usr/bin/VBoxmanage
	BASENAME=/usr/bin/basename
	#nom de machine virtuelle
	VM=winxp
	#partition a partager avec win
	hostpath[0]=/mnt/sources
	hostpath[1]=/mnt/documents
	
}

_unset(){
	unset VM VBOX hostpath[@] part
}

_set

# ${hostpath[@]} => etend tous les elements du tableau en mots distincts, { imp.
# pour tous les elements du tableau
for i in ${hostpath[@]}; do
	#recupere le nom de la partition
	part=$(${BASENAME} $i);
	#supprime une eventuelle partition deja existante
	echo "${VBOX} sharedfolder remove ${VM} -name $part"
	${VBOX} sharedfolder remove ${VM} -name $part
	#en cree une nouvelle
	echo "${VBOX} sharedfolder add ${VM} -name $part -hostpath $i"
	${VBOX} sharedfolder add ${VM} -name $part -hostpath $i
done

_unset
