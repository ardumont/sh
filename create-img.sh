#!/bin/bash

#initialisation des variables
_set(){
	#commandes
	QEMU_CREATE_IMG="qemu-img create -f qcow2"
	#taille de l'image par defaut
	SIZE=10G
	#variables pour le fichier d'aide
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#destruction des variables
_unset(){
	unset rep com QEMU_CREATE_IMG SIZE IMG
}

#fonction d'aide
help(){
	#retire l'extension sh du nom de la commande
	com="${com%.*}"
	#affiche le contenu du fichier aide correspondant
	file_help="$rep/help/$com";
	#affiche le contenu du fichier d'aide
	[ -f $file_help ] && cat $file_help
	exit $1;
}

#parse les options du programme
process_opt(){
	#si pas d'argument
	if [ $# -eq 0 ];
	then
		#erreur
		help 1;
	fi
	#x::	-> parametre optionnel
	#x:		-> parametre obligatoire
	#x		-> pas de parametre
	OPT=`getopt -o i:s:h \
		--longoptions image:size:help \
	     -n '$com.bash' -- "$@"`
	#teste la valeur de retour de getopt
	case $? in
		0);;#tout va bien, je vais bien!
		1)help 1;;#erreur
		*)echo "unexpected error in 'getopt'";exit 1;;#erreur inconnue
	esac
	#recupere les arguments eventuels
	for a in $OPT; do
		case "$a" in
			-i|--image)
				IMG=$2
				shift 2;;
			-s|--size)
				SIZE=$2;
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done
	#test que les options obligatoires sont bien remplies
	#nom de domaine n'est pas specifie alors erreur
	if [ -z $IMG ]; then
		echo "nom de l'image est obligatoire";
		help 1;
	fi
}

#programme principale
main(){
	#recupere les options du programme
	process_opt $*
	#creation de l'image
	echo "$QEMU_CREATE_IMG $IMG $SIZE"
	$QEMU_CREATE_IMG $IMG $SIZE
}

#initialise les variables
_set

#lance le programme
main $*

#detruit les variables
_unset

#sortie du programme
exit 0;
