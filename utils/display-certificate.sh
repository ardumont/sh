#!/bin/bash

#initialisation des variables
_set(){
	#commandes
	OPENSSL=openssl
	#repertoires de travail
	CA_CERT_DIR="$HOME/openssl/cert"
	#variables pour le fichier d'aide
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#destruction des variables
_unset(){
	unset rep com OPENSSL CA_CERT_DIR
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
	OPT=`getopt -o c:h \
		--longoptions common-name:help \
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
			-c|--common-name)
				CN=$2
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done
	#test que les options obligatoires sont bien remplies
	#nom de domaine n'est pas specifie alors erreur
	if [ -z $CN ]; then
		echo "common-name is mandatory!";
		help 1;
	fi
}

#option de generation de clef rsa
#param	$1	nom du certificat
show(){
	$OPENSSL x509 -in $1 -noout -text
}

#programme principale
main(){
	#recupere les options du programme
	process_opt $*
	#creation du chemin vers le certificat
	CERT=$CA_CERT_DIR/$CN.pem
	#test d'existence
	if [ ! -f $CERT ]; then
		echo "$CERT: no such file!"
		exit 1;
	fi
	#affiche le contenu du certificat
	show $CERT
}

#initialise les variables
_set

#lance le programme
main $*

#detruit les variables
_unset

#sortie du programme
exit 0;
