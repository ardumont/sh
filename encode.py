#!/usr/bin/python

import sys,os,commands,glob
from optparse import OptionParser

parser = OptionParser()
parser.add_option("-b",	"--band",		dest="artist",	default="defaultartist",	help="the artist")
parser.add_option("-a",	"--album",		dest="album",	default="defaultalbum",		help="the album")
parser.add_option("-y",	"--year",		dest="year",	default="defaultyear",		help="the year of the album")
parser.add_option("-s",	"--srcdir",		dest="srcdir",	default="defaultsrcdir",	help="the files of the directory to encode")
parser.add_option("-c",	"--command",	dest="encoding",default="/usr/bin/lame",	help="the command to encode")
parser.add_option("-e",	"--ext-src",	dest="ext_src",	default="wav",				help="the extension to encode")
parser.add_option("-E",	"--ext-dest",	dest="ext_dest",default="mp3",				help="the encoded extension")

# parsing options
(options, args) = parser.parse_args()

# option retrieval
artist=options.artist
album=options.album
year=options.year
srcdir=options.srcdir
# encoding command
encoding = options.encoding
# extension
ext_src="."+options.ext_src
ext_dest="."+options.ext_dest
ext_src_len=len(ext_src)

print "Starting encoding for "+artist+" - "+album+" in "+year+" ..."

artist='"'+artist+'"'
album='"'+album+'"'

# execute the listing of the directory given
src=srcdir+os.sep+"*"+ext_src
listing=glob.glob(src)
erreur=False

# for each file found, we can do its encoding
for fichierin in listing:
	# rename the file without the old extension but with the new one
	fichierout=fichierin[0:-ext_src_len]+ext_dest
	# split the pathname (in rep) and the name of the file (in track)
	(rep,track)=os.path.split(fichierin)
	# the number of the track
	num=track[0:2]
	# the name of the track
	track='"'+track[3:-ext_src_len].replace('_',' ')+'"'
	# create the command with its parameters formated
	cmd=encoding+" --preset standard --tt "+track+" --ta "+artist+" --tl "+album+" --ty "+year+" --tn "+num+" "+fichierin+" "+fichierout
	# print the command we will execute
	print cmd
	# execute the command
	status,result=commands.getstatusoutput(cmd)
	# display the result of the command
	print result
	# and its status
	if status!=0:
		erreur=True

print "Encoding done !"
if erreur == False:
	print "Everything was fine, now deleting *"+ext_src
	for f in listing:
		os.remove(f)
	sys.exit(0)
else:
	print "Something went wrong"
	# espece d'autiste :d
	sys.exit(-42)

