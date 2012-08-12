#!/bin/bash

#initialisation des variables
_set(){
	#commandes
	CP=cp
	ECHO=echo
	#variables contenant les valeurs par defaut
	DTEMPLATE=/home/tony/boulot/presentation
	#ne pas toucher
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
	err="error $com : ";	#message d'erreur
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
	OPT=`getopt -o d:h \
		--longoptions directory:help \
	     -n '$com.bash' -- "$@"`
	#teste la valeur de retour de getopt
	case $? in
		0);;#tout va bien, je vais bien!
		1)help 1;;#erreur
		*)echo "$err unexpected error in 'getopt'";exit 1;;#erreur inconnue
	esac
	#recupere les arguments eventuels
	for a in $OPT; do
		case "$a" in
			-i|--image)
				DIR=$2
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done
	#teste que l'image est bien remplie
	if [ -z $DIR ]; then
		echo "$err the directory name is mandatory";
		help 1;
	fi
}

#programme principale
main(){
	#recupere les options du programme
	process_opt $*
	#creation du repertoire seulement si le repertoire n'existe pas deja
	if [ ! -d $DIR ]; then
		$ECHO "create the folder '$DIR'..."
		$CP -rp $DTEMPLATE $DIR
		$ECHO "'$DIR' created!"
	else
		$ECHO "$err directory '$DIR' already exists! exiting..."
		exit 1;
	fi
}

#initialise les variables
_set

#lance le programme
main $*

#sortie du programme
exit 0;
