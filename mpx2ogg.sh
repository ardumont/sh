#!/bin/bash

if [ -z "$2" ]; then
	echo "Usage: `basename $0` <chemin> n (n = qualité)"
	exit
fi

cd "$1"
let i=1
find ./ -type f | grep mp3 | sort > .list1
find ./ -type f | grep mpc | sort > .list2
sed -e 's/.mp3/.ogg/g' .list1 > .list1_ogg
sed -e 's/.mpc/.ogg/g' .list2 > .list2_ogg

MP3=`cat .list1 | sed -n "$i"p`
OGG=`cat .list1_ogg | sed -n "$i"p`

while [ -n "$MP3" ]
do
	mpg321 -v "$MP3" --wav tmp.wav ; rm -f "$MP3" ; oggenc -q $2 tmp.wav -o "$OGG" ; rm -f tmp.wav
	let i=$i+1
	MP3=`cat .list1 | sed -n "$i"p`
	OGG=`cat .list1_ogg | sed -n "$i"p`
done 

let i=1
MPC=`cat .list2 | sed -n "$i"p`
OGG=`cat .list2_ogg | sed -n "$i"p`

while [ -n "$MPC" ]
do
	mppdec "$MPC" tmp.wav 1> /dev/null && rm -f "$MPC" && oggenc -q $2 tmp.wav -o "$OGG" ; rm -f tmp.wav
	let i=$i+1
	MPC=`cat .list2 | sed -n "$i"p`
	OGG=`cat .list2_ogg | sed -n "$i"p`
done

rm -f .list* 
