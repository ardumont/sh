 #!bash

_set(){
	#commands
	FIND=locate
	#files or folder to delete
	noise="Thumbs.db .DS_Store *~ .*~"
}

_unset(){
	unset FIND noise
}

_set

echo "Delete '${noise}' ..."
for i in $($FIND $noise); do
    # directory
    [ -d $i ] && echo "rm -r $i" && rm -r $i
    # file but not a link
    [ -f $i ] && echo "rm $i" && rm $i
done
echo "Delete '${noise}' done!"

_unset
