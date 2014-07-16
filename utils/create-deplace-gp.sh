#!bash

#initialisation des variables
init(){
	#commandes
	MV="/usr/bin/mv"
	MKDIR="/usr/bin/mkdir -p"
	ECHO="/usr/bin/echo"
	TR="/usr/bin/tr"
	CAT="/usr/bin/cat"
	#
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#fonction d'aide
help(){
	#retire l'extension sh du nom de la commande
	com="${com%.*}"
	#affiche le contenu du fichier aide correspondant
	file_help="$rep/help/$com";
	#affiche le contenu du fichier d'aide
	[ -f $file_help ] && $CAT $file_help
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
	OPT=`getopt -o p:h \
		--longoptions pattern:help \
	     -n '$com.bash' -- "$@"`
	#teste la valeur de retour de getopt
	case $? in
		0);;
		1)help 1;;
		*)echo "unexpected error in 'getopt'";
		exit 1;;
	esac
	#recupere les arguments eventuels
	for a in $OPT; do
		case "$a" in
			-p|--pattern)
				PATTERN="$2"
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done
	#teste que la variable PATTERN est remplie
	if [ -z $PATTERN ]; then
		echo "erreur $com : pattern obligatoire";
		help 1;
	fi
}

#creer le nom du repertoire a partir du pattern
#passe en parametre de la commande
to_folder(){
	#remplace toutes les majuscules par des minuscules
	#puis remplace tous les espaces par des tabulations
	DIR=$($ECHO "$1" | \
			$TR '[:upper:]' '[:lower:]' | \
			$TR " " "_");
	$ECHO -e "PATTERN=$1\nDIR=$DIR"
}

#programme principal
main(){
	#recupere les options du programme
	process_opt $@
	#creation du nom du repertoire
	to_folder $PATTERN
	#creation du repertoire
	echo "$MKDIR $DIR"
#	$MKDIR $DIR
	#deplacement des fichiers repondants au pattern
	echo "$MV '$PATTERN*' $DIR"
#	$MV "$PATTERN*" $DIR
}

#initialise les variables
init

#lance le programme
main $@

#sortie du programme
exit 0;
