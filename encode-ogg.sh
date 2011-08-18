#!/bin/bash

#initialisation des variables
_set()
{
	#commandes
	FFMPEG=$(which ffmpeg2theora)
	#variables pour le fichier d'aide
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
}

#destruction des variables
_unset()
{
	unset rep com ICONV
}

#fonction d'aide
help()
{
	#retire l'extension sh du nom de la commande
	com="${com%.*}"
	#affiche le contenu du fichier aide correspondant
	file_help="$rep/help/$com";
	#affiche le contenu du fichier d'aide
	[ -f $file_help ] && cat $file_help
	exit $1;
}

#parse les options du programme
process_opt()
{
	#si pas d'argument
	if [ $# -eq 0 ];
	then
		#erreur
		help 1;
	fi
	#x::	-> parametre optionnel
	#x:		-> parametre obligatoire
	#x		-> pas de parametre
	OPT=`getopt -o t:rh \
		--longoptions target:recursive \
	     -n 'Erreur' -- "$@"`
	#teste la valeur de retour de getopt
	case $? in
		0);;#tout va bien, je vais bien!
		1)help 1;;#erreur
		*)echo "unexpected error in 'getopt'";exit 1;;#erreur inconnue
	esac
	#recupere les arguments eventuels
	for a in $OPT; do
		case "$a" in
			-t|--target)
				TARGET=$2
				shift 2;;
			-r|--recursive)
				opt_recursive=1;
				shift 1;;
			-h|--help)
				help 0;
				shift;;
		esac
	done

	# teste que les options obligatoires sont bien remplies
	# nom de domaine n'est pas specifie alors erreur
	if [ -z $TARGET ]; then
		echo "Le répertoire ou le fichier cible est obligatoire";
		help 1;
	fi
}

# fonction de modification de l'encodage du fichier
_encode_file()
{
    # fichier temporaire
    TEMP=./tmp.txt
    echo "$FFMPEG --optimize $1"
    # tranforme le fichier flv d'entrée en ogg
    $FFMPEG --optimize $1
    # supprime le fichier d'entrée
    echo "rm $1"
    rm $1
}

# fonction de modification de l'encodage des fichiers du répertoire
_encode_folder()
{
    echo "folder target : $1"
    for i in $(ls --color=never $1); do
        filename="$1/$i";
        if [ -f $filename ]; then
            echo "'$filename' is a file."
            _encode_file $filename
        fi
    done
}

# fonction de modification du contenu des répertoires du répertoire cible et des fichiers du répertoire cible
_encode_folder_recursive()
{
    echo "folder target : $1"
    for i in $(ls --color=never $1); do
        filename="$1/$i";
        if [ -f $filename ]; then
            echo "'$filename' is a file."
            _encode_file $filename;
        elif [ -d $filename ]; then
            echo "'$filename' is a folder."
            _encode_folder_recursive $filename;
        else
            # on ne devrait jamais arrive la
            echo "'$filename' n'est ni un fichier ni un répertoire (absolument faux -> problème dans le script.)"
        fi
    done
}

# programme principal
main()
{
	# recupere les options du programme
	process_opt $*
	# modification de l'encodage
    if [ -f $TARGET ]; then
        echo "'$TARGET' is a file."
        _encode_file $TARGET
    elif [ -d $TARGET ]; then
        echo "$TARGET is a folder."
        if [ $opt_recursive -eq 1 ]; then
            echo "recursive mode."
            _encode_folder_recursive $TARGET
        else
            echo "flat mode."
            _encode_folder $TARGET
        fi
    fi
}

#initialise les variables
_set

#lance le programme
main $*

#detruit les variables
_unset

#sortie du programme
exit 0;
