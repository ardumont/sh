#!/bin/bash
IFS=$(echo -e "\n\r\t")
which ffmpeg 1>/dev/null || (echo "Vous devez préalablement installer ffmpeg." && exit 1)

echo "=== Conversion mov2avi ==="
echo ""
echo "Traitement de $1"

AVIFILE=$( echo $(basename $( echo $1 | tr "[:upper:]" "[:lower:]" ) .mov).avi)
ffmpeg -i $1 -g 60 -vcodec msmpeg4v2 -acodec pcm_u8 $AVIFILE

