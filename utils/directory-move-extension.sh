#!bash

if [ $# -ne 3 ]; then
  echo -e "\tCeci est un script servant a renommer toutes les extensions "\
          "des fichiers du repertoire (et de ces sous repertoires) specifie"\
          " en parametre ayant l'extension specifie en parametre.\n"\
          "\tUsage : $0 <rep> <filtre_ext> <new_ext>";
  exit 1;
fi

#appelle le script qui renomme tous les fichiers d'extensions $2 sur le repertoire $1
move-extension.sh $1 $2 $3;

#puis on descend dans l'arborescence du repertoire $1
for i in $1/*; do
  if [ -d $i ]; then
    directory-move-extension.sh $i $2 $3;
  fi
done
