#!bash

# the first command to help set the commands and other non optionnal setup
_set()
{
    # commands
    MOUNT=$(which mount);
    UMOUNT=$(which umount);
    CHROOT=$(which chroot);
    BASH=$(which bash);
    MKDIR=$(which mkdir)

    # gentoo home from within another unix or linux box
    GENTOO_HOME=/mnt/gentoo
    GENTOO_BOOT=${GENTOO_HOME}/boot
    GENTOO_SLASH_HOME=${GENTOO_HOME}/home
    GENTOO_OPT=${GENTOO_HOME}/opt
    GENTOO_VAR=${GENTOO_HOME}/var
    GENTOO_USR=${GENTOO_HOME}/usr
    GENTOO_DEV=${GENTOO_HOME}/dev
    GENTOO_PROC=${GENTOO_HOME}/proc

    # mounting option (do we have to mount the drives)
    opt_mount=1
    # umount option (to unmount the drives used for chrooting the environment)
    opt_umount=0

	#variables pour le fichier d'aide
	rep="$(dirname ${0})";	#repertoire du script
	com="$(basename ${0})";	#nom de la commande
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
# processing options
process_opt()
{
	# is there argument?
	if [ $# -eq 0 ];
	then
		# if none, error
		help 1;
	fi
	# x::	-> parametre optionnel
	# x:		-> parametre obligatoire
	# x		-> pas de parametre
	OPT=`getopt -o b:h,m,u \
		--longoptions block:help,mount,umount \
	     -n '$com.bash' -- "$@"`

	# is everything ok?
	case $? in
		0);;        # end
		1)help 1;;  #error
		*)echo "unexpected error in 'getopt'";exit 1;;  #unknown error
	esac

	# retrieve the options
	for a in $OPT; do
		case "$a" in
			-m|--mount)
				opt_mount=1
				shift;;
            -u|--umount)
                opt_umount=1
                shift;;
			-b|--block)
				BLOCK=$2;
				shift 2;;
			-h|--help)
				help 0;
				shift;;
		esac
	done

}

#programme principal
main()
{
	# processing options
	process_opt $*

    # unmounting the disks
    if [ ${opt_umount} -eq 1 ]; then
        # démonte les différentes partitions de l'environnement gentoo
        echo "${UMOUNT} ${GENTOO_PROC}"
        ${UMOUNT} ${GENTOO_PROC}
        echo "${UMOUNT} ${GENTOO_DEV}"
        ${UMOUNT} ${GENTOO_DEV}
        echo "${UMOUNT} ${GENTOO_BOOT}"
        ${UMOUNT} ${GENTOO_BOOT}
        echo "${UMOUNT} ${GENTOO_USR}"
        ${UMOUNT} ${GENTOO_USR}
        echo "${UMOUNT} ${GENTOO_VAR}"
        ${UMOUNT} ${GENTOO_VAR}
        echo "${UMOUNT} ${GENTOO_OPT}"
        ${UMOUNT} ${GENTOO_OPT}
        echo "${UMOUNT} ${GENTOO_SLASH_HOME}"
        ${UMOUNT} ${GENTOO_HOME}
        echo "${UMOUNT} ${GENTOO_HOME}"
        ${UMOUNT} ${GENTOO_HOME}
   else # chrooting on the gentoo environment

	    # does the block disk exist?
	    if [ ! -b ${BLOCK} ]; then
		    echo "error mount_gentoo.sh : '${BLOCK}' missing!"
		    exit 1;
	    fi

        # do we have to mount a block system?
        if [ ${opt_mount} -eq 1 ]; then
            # is there a GENTOO_HOME?
            if [ ! -d ${GENTOO_HOME} ]; then
                echo "${MKDIR} ${GENTOO_HOME}"
                ${MKDIR} ${GENTOO_HOME}
            fi;

            # différentes partitions de l'environnement gentoo
            echo "${MOUNT} ${BLOCK}5 ${GENTOO_HOME}"
            ${MOUNT} ${BLOCK}5 ${GENTOO_HOME}
            echo "${MOUNT} ${BLOCK}1 ${GENTOO_BOOT}"
            ${MOUNT} ${BLOCK}1 ${GENTOO_BOOT}
            echo "${MOUNT} ${BLOCK}6 ${GENTOO_USR}"
            ${MOUNT} ${BLOCK}6 ${GENTOO_USR}
            echo "${MOUNT} ${BLOCK}7 ${GENTOO_VAR}"
            ${MOUNT} ${BLOCK}7 ${GENTOO_HOME}
            echo "${MOUNT} ${BLOCK}8 ${GENTOO_OPT}"
            ${MOUNT} ${BLOCK}8 ${GENTOO_OPT}
            echo "${MOUNT} ${BLOCK}9 ${GENTOO_SLASH_HOME}"
            ${MOUNT} ${BLOCK}9 ${GENTOO_HOME}

            # monte les systemes de fichiers indispensables au bon fonctionnement de tootoo
            echo "${MOUNT} -t proc none ${GENTOO_PROC}"
            ${MOUNT} -t proc none ${GENTOO_PROC}
            echo "${MOUNT} -o bind /dev ${GENTOO_DEV}"
            ${MOUNT} -o bind /dev ${GENTOO_DEV}
        fi

        # chroote on the gentoo environment
        echo "${CHROOT} ${GENTOO_HOME} ${BASH}"
        ${CHROOT} ${GENTOO_HOME} ${BASH}
    fi
}

#initialise les variables
_set

#lance le programme
main $*

#sortie du programme
exit 0;
