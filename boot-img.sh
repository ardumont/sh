#!/bin/bash

set -e

#initialisation des variables
_set(){
	#commandes
	QEMU=qemu
	SU=su
	QEMUHELPER="$HOME/bin/qemu-helper.sh"
	#variables contenant les valeurs par defaut
	CDROM=/dev/cdrom	#peripherique du cd
	RAM=512M			#taille memoire par defaut
	BOOT=c				# a floppy, c image disque, d cdrom, n ethernet
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#destruction des variables
_unset(){
	unset rep com QEMU CDROM RAM BOOT SU QEMUHELPER
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
	OPT=`getopt -o i:c:m:b:h \
		--longoptions image:cdrom:memory:boot:help \
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
			-c|--cdrom)
				CDROM=$2;
				shift 2;;
			-m|--memory)
				RAM=$2
				shift 2;;
			-b|--boot)
				BOOT=$2;
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done
	#teste que l'image est bien remplie
	if [ -z $IMG ]; then
		echo "erreur boot-img.sh : nom de l'image est obligatoire";
		help 1;
	fi
}

#programme principal
main(){
	#recupere les options du programme
	process_opt $*
	#test de l'existence de l'image
	if [ ! -f $IMG ]; then
		echo "erreur boot-img.sh : '$IMG' introuvable ou inexistante!"
		exit 1;
	fi
	#prepare le necessaire a l'utilisation de qemu
	$SU -c "$QEMUHELPER start"
	#creation de l'image
	echo "$QEMU -hda $IMG -cdrom $CDROM -boot $BOOT -m $RAM"
	$QEMU -hda $IMG -cdrom $CDROM -boot $BOOT -m $RAM -net nic -net user
	#retablit les choses dont le systeme a l'etat normal n'a pas besoin
	$SU -c "$QEMUHELPER stop"
}

#initialise les variables
_set

#lance le programme
main $*

#detruit les variables
_unset

#sortie du programme
exit 0;
