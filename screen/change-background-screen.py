#!/usr/bin/python
# -*- coding: utf-8 -*-

# Script pour changer son fond d'ecran à intervalles réguliers pour GNOME									  
# Merci à Mathieu et à VIM :)																									  

## Importation des librairies nécessaires
import os, re, time, random, logging

# Log everything, and send it to stderr.
logging.basicConfig(level=logging.DEBUG)

# Dossiers des images
# syntaxe: chemin = ["premierchemin ","deuxiemechemin","etc"]

aCheminsRepertoireImages = ["/home/chris/documents/photo_video/01.famille/01.theo"]

# Récuperation de la liste des images dans un (ou plusieurs) dossier(s) (en mode récurcif)
# Creation et compilation du pattern de recherche des images (non sensibles à la casse)
pattern = re.compile(r'.*\.(jpeg|jpg|png|gif|swg)$', re.IGNORECASE)
# Creation du tableau des images sur lequel le random de recherche aura lieu
aImages = []
# Demarrage du remplissage des chemins des images
# Pour chaque chemin de repertoire contenant des images renseigne,
for sChemin in aCheminsRepertoireImages:
	# On se deplace dans le chemin
	for sPicture in os.walk(sChemin):
		# Pour chaque fichier que l'on rencontre
		for i in sPicture[2]:
			# on determine s'il s'agit d'une image ou non
			if pattern.match(i):
				# si oui, on l'ajoute à la liste des images random
				aImages.append(sPicture[0] + "/" + i)

# Amélioration du système de hasard
nSeedSeconds = int(time.strftime('%S')) * int(time.strftime('%H')) * int(time.strftime('%M'))
for i in range(0, nSeedSeconds):
	random.random()

# Nombre de secondes avant de changer l'image
# ici toutes les 30 secondes
nSeconds = 30

# Boucle infinie
while 1:
	# obtenir aléatoirement une image parmi la liste du tableau aImages
	position = random.randint(0, len(aImages) - 1)
	sFichier = (aImages[position])

	# Creation de la commande
	# Modification du fond d'ecran (commande gnome)
	comm = "gconftool-2 -t string -s /desktop/gnome/background/picture_filename '" + str(sFichier) + "'"
	# modfication du fond d'ecran (commande windows non encore testé sous win) 
	# comm = "reg add \"HKCU\Control Panel\Desktop\" /v Wallpaper /t REG_SZ /d " +  str(sFichier) + " /f rundll32.exe User32.dll,UpdatePerUserSystemParameters "
	logging.debug("commande d'exécution :");
	logging.debug(comm);

	# Exécution de la commande
	os.system(comm)

	# changer les images au bout d'X seconde(s)
	time.sleep(nSeconds)


