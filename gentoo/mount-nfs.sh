#!bash

_set(){
	#serveur
	IP=192.168.0.2
	#volumes a monter
	SERIES=/mnt/series
	DETENTE=/mnt/detente
	MUSICS=/mnt/musics
	SOURCES=/mnt/sources
	#commande a executer
	MOUNT=mount
	FLAG="-t nfs"
}

_unset(){
	unset IP SERIES DETENTE MUSICS SOURCES MOUNT FLAG
}

_set

echo "montage de ${SERIES}"
${MOUNT} ${FLAG} ${IP}:${SERIES} ${SERIES}
echo "montage de ${DETENTE}"
${MOUNT} ${FLAG} ${IP}:${DETENTE} ${DETENTE}
echo "montage de ${MUSICS}"
${MOUNT} ${FLAG} ${IP}:${MUSICS} ${MUSICS}
echo "montage de ${SOURCES}"
${MOUNT} ${FLAG} ${IP}:${SOURCES} ${SOURCES}

_unset
