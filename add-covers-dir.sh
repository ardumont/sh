#/bin/sh

# Adds .directory files in the music collection, convert jpegs to pngs
# Does not need amarok running
#
# Aurelien Bompard <gauret@free.fr>
# modified by Antoine Romain Dumont<eniotna.t@gmail.com> to suit his needs
# GPL.

#musicdirs=`awk -F "=" '/^Collection Folders/ {print $2}' ~/.kde/share/config/amarokrc`

musicdirs=$1

IFS=","
for musicdir in $musicdirs; do 
    unset IFS
    find "$musicdir" -iname '*.png' -o -iname '*.jpg' | while read imgfile; do
        dirfile=`dirname "$imgfile"`/.directory
        ext=`echo "$imgfile" | sed -e 's/.*\.\(...\)$/\1/g'` # extract extention
        if [ "$ext" == "jpg" ]; then # KDE can only handle PNG files as directory icon
            imgfilejpg="$imgfile"
            imgfile="`echo "$imgfile" | sed -e 's/jpg$/png/g'`"
            convert "$imgfilejpg" "$imgfile"
            rm -f "$imgfilejpg"
        fi
        if [ ! -f "$dirfile" ]; then
            echo "Creating $dirfile"
          cat > "$dirfile" << EOF
[Desktop Entry]
Icon=./`basename "$imgfile"`
EOF
        elif ( ! grep -q "^Icon" "$dirfile"); then
            echo "Adding 'Icon' in $dirfile"
            echo "Icon=./`basename "$imgfile"`" >> "$dirfile"
        fi
    done
done
