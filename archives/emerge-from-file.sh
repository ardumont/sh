#!/bin/bash
#aide -> fichier /root/help/my_emerge

#les fonctions
_set(){
	#commandes
	EMERGE=emerge			#commande principale
	#variable
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
	pkg="";					#les packages
	sep="/";				#difference entre une ligne invalide et une ligne valide
	opt_without_version=0;	#option avec ou sans version?
}

_unset(){
	unset EMERGE FILE FETCH PRETEND rep com pkg sep opt_without_version
}

#fonction d'aide
help(){
	#retire l'extension sh
	com="${com%.*}"
	#affiche le contenu du fichier aide correspondant
	file_help="${rep}/help/${com}";
	#affiche le contenu du fichier d'aide
	if [ -f $file_help ]; then cat $file_help; fi
	exit $1;
}

#version du programme qui traite les packages avec leur version
traitement_defaut(){
	#lancement du programme
	for i in $(cat ${FILE});
	do
		#si ligne vide alors ligne non valide
		if [ ${i} = "" ];
		then
			continue;
		fi
		#si la ligne ne contient pas un / alors ko
		echo ${i} | grep ${sep}
		#si ko alors on ne tient pas compte de la ligne
		if [ $? != 0 ];
		then
			continue;
		fi
		#stocke les packages dans une chaine pour ne lancer qu'une fois emerge
		pkg="${pkg} =${i}"
	done
}

#version du programme qui traite les packages sans leur version
traitement_sans_version_package(){
	#lancement du programme
	for i in $(cat ${FILE});
	do
		#si ligne vide alors ligne non valide
		if [ ${i} = "" ];
		then
			continue;
		fi
		#si la ligne ne contient pas un / alors ko
		echo ${i} | grep ${sep}
		#si ko alors on ne tient pas compte de la ligne
		if [ $? != 0 ];
		then
			continue;
		fi
		#sinon tout est ok!
		#donc on tronque les versions des packages, separateur '-'
		package=${i%-*};
		#s'il reste encore des '.', separateurs des chiffres de version, alors on a pas encore enleve tous les chiffres de versions
		echo ${package} | grep '\.';
		while [ $? = 0 ];
		do
			package=${package%-*};
			echo ${package} | grep '\.';
		done
		echo $package
		#stocke les packages dans une chaine pour ne lancer qu'une fois emerge
		pkg="${pkg} ${package}"
	done
}

_set

#si pas d'argument alors qu'il faut au moins le fichier contenant les packages
if [ $# -eq 0 ];
then
	help 1;
fi

#e::	-> parametre optionnel
#f:		-> parametre obligatoire
#F		-> pas de parametre
TEMP=`getopt -o f:h,F,p,w --longoptions file:help,fetch,pretend,without_version \
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
		-F|--fetch)#active l'option pour fetcher les arguments
			FETCH="-f";
			shift;;
		-p|--pretend)#active l'option pour fetcher les arguments
			PRETEND="-p -v";
			shift;;
		-w|--without-version)#on retire les versions des packages
			opt_without_version=1;
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

if [ $opt_without_version = 1 ];
then
	traitement_sans_version_package;
else
	traitement_defaut;
fi

#lance emerge
echo "${EMERGE} ${pkg} ${FETCH} ${PRETEND}"
${EMERGE} ${pkg} ${FETCH} ${PRETEND}

_unset
