#!/usr/bin/env bash

#initialisation des variables
_set(){
	#commandes
	OPENSSL=openssl
	#repertoires de travail
	CA_CERT_DIR="$HOME/openssl/cert"
	CA_PRIVATE_KEY_DIR="$HOME/openssl/private"
	#variables du programme (valeurs par defaut)
	NUMBITS=2048;						#taille par defaut des clefs du certif.
	DAYS=365;							#duree par defaut du certificat
	C=fr;								#pays
	L=paris;							#lieu
	O="orgname";		        #organisation
	emailAddress="test@test.com";	#mail
	#variables pour le fichier d'aide
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
	OPT=`getopt -o c:C:d:n:h,F,p,w \
		--longoptions common-name:CAname:days:numbits:help \
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
			-C|--CAname)
				CA_NAME=$2;
				shift 2;;
			-d|--days)
				DAYS=$2;
				shift 2;;
			-n|--numbits)
				NUMBITS=$2
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
	#fichier du certificat d'autorite manquant
	if [ -z $CA_NAME ]; then
		echo "file CAname without its extension is mandatory!";
		help 1;
	fi
}

#option de generation de clef rsa
#param	$1	nom du certificat
#param	$2	taille de la clef
gen_rsa(){
	$OPENSSL genrsa -F4 -out $CA_PRIVATE_KEY_DIR/$1.key $2
}

#creation d'un lien sur un certificat (contourner erreur 18 de openssl verify)
#param	$1	nom du certificat
ca_hash(){
	#creation du hash du certificat passe en parametre
	HASH=$($OPENSSL x509 -noout -hash -in $CA_CERT_DIR/$1.pem)
	#si lien deja existant
	if [ -L $CA_CERT_DIR/$HASH.0 ]; then
		echo "lien deja existant sur le certificat $1";
	else
		ln -s $CA_CERT_DIR/$1.pem $CA_CERT_DIR/$HASH.0
	fi
}

#creation d'un nouveau certificat
#param	$1	nom du certificat
#param	$2	taille de la clef du certificat
#param	$3	nombre de jour avant expiration du certificat x509
ca_new(){
	echo "create key for new certificate..."
	gen_rsa $1 $2;
	echo "file $CA_PRIVATE_KEY_DIR/$1.key created!";
	echo "Creating CA certificate..."
	$OPENSSL req -new -key $CA_PRIVATE_KEY_DIR/$1.key -x509 -days $3 \
		-out $CA_CERT_DIR/$1.pem -subj \
		"/C=$C/L=$L/O=$O/CN=$CN/emailAddress=$emailAddress"
	ca_hash $1
	echo "CA certificate created!";
}

#programme principale
main(){
	#recupere les options du programme
	process_opt $*
	#lance le programme principal
	ca_new $CA_NAME $NUMBITS $DAYS
}

#initialise les variables
_set

#lance le programme
main $*

#sortie du programme
exit 0;
