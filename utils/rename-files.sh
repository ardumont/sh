#!bash

for fichier in $(ls *._jpg_);
do
     nouveau=${fichier%_jpg_}pdf
     mv $fichier $nouveau
done
