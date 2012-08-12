#!/bin/bash

if [ $# -ne 3 ]; then
  echo -e "\tCeci est un script servant a renommer toutes les extensions "\
          "des fichiers du repertoire specifie en parametre ayant "\
          "l'extension specifie en parametre.\n"\
          "\tUsage : $0 <rep> <filtre_ext> <new_ext>";
  exit 1;
fi

#si ce n'est pas un repertoire on ne fait rien
if [ ! -d $1 ]; then
  echo "$0 : sortie";
  exit;
fi

#recuperation du nom du repertoire
dir_name=$(basename $1);

#si le repertoire est un repertoire "php" alors on ne fait rien
if [ $dir_name = "php" ]; then
  echo "$0 : exit";
  exit;
fi;

#sinon on renomme le contenu de ce repertoire
for i in $1/*; do 
  #recuperation du nom complet du fichier
  name=$(basename $i);
  #recuperation du nom sans l'extension
  nom=`echo $name | sed "s/\(.*\)\.\(.*\)/\1/g"`;
  #puis uniquement l'extension
  ext=`echo $name | sed "s/\(.*\)\.\(.*\)/\2/g"`;
 
  if [ $ext = $2 ]; then
    echo "mv $i $1/$nom.$3";
    #mv $i $pathname/$nom.$3;
  fi
done      
  
  
