#!/usr/bin/env bash

#!/usr/bin/env bash
#aide -> fichier /root/help/my_emerge

#les fonctions
init(){
	#commandes
	EMERGE="/usr/bin/emerge -Du"	#commande principale
	CUT=/usr/bin/cut
	GREP=/bin/grep
	ECHO=/usr/bin/echo
	AWK="/usr/bin/awk '{print $4}'"
	#options du script
	opt_append=0			#par defaut creation ou destruction du fichier deja existant
	#variable
	PKG=world				#par defaut le package principal est "world"
	sep="/"					#separateur de lignes
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#fonction d'aide
help(){
	#retire l'extension sh
	com="${com%.*}"
	#affiche le contenu du fichier aide correspondant
	cat "${rep}/help/${com}";
	exit $1;
}

#lance le calcul et stocke le resultat a la suite du fichier
with_concat(){
	$ECHO "( $EMERGE $PKG -p | $GREP $sep | $AWK ) >> $FILE"
	( $EMERGE $PKG -p | $GREP $sep | $AWK ) >> $FILE
}

#lance le calcul et stocke le resultat dans le fichier
without_concat(){
	$ECHO "( $EMERGE $PKG -p | $GREP $sep | $AWK ) > $FILE"
	( $EMERGE $PKG -p | $GREP $sep | $AWK ) > $FILE
}

process_opt(){
	if [ $# -eq 0 ];
	then
		help 1;
	fi

	#e::	-> parametre optionnel
	#f:		-> parametre obligatoire
	#F		-> pas de parametre
	TEMP=`getopt -o f:p:h,a, --longoptions file:pkg:help,append \
	     -n '$com.bash' -- "$@"`

	# Note the quotes around `$TEMP': they are essential!
	eval set -- "$TEMP"

	if [ $? != 0 ];
	then
		echo "probleme interne!";
		exit 1;
	fi

	#recupere les arguments eventuels
	while true ; do
		case "$1" in
			-f|--file)#initialise le fichier contenant les packages
				FILE=$2
				shift 2;;
			-p|--pkg)#recuperation du package
				PKG=$2;
				shift 2;;
			-a|--append)#option de concatenation
				opt_append=1;
				shift;;
			-h|--help)#lance l'aide
				help 0;
				shift;;
			--)#fin
				shift;
				break;;
			*)#soucis
				echo "probleme interne!";
				help 1;;
		esac
	done
}

main(){
	#parse les options
	process_opt $*
	#programme principal
	( [ $opt_append = 1 ] && with_concat ) || without_concat
}

init

main $*
