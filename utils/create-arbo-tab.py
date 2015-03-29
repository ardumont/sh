#!/usr/bin/env python

import sys,os,commands,string,glob
from optparse import OptionParser

######### parser #########

# parse the arguments/options of the script
parser = OptionParser()
parser.add_option("-t", "--target"          , dest="target", default=".", help="working directory")
parser.add_option("-f", "--filter"          , dest="filter", default="*", help="to filter the files")
parser.add_option("-v",	"--verbose"  , action="store_true" , dest="opt_verbose"        , help="verbose mode"  , default=False)
parser.add_option("-n",	"--dry-clean", action="store_true" , dest="opt_dryclean"       , help="display mode"  , default=False)
parser.add_option("-r",	"--recursive", action="store_true" , dest="opt_recursive"      , help="recursive mode", default=False)

# retrieve the arguments of the script
(options, args) = parser.parse_args()
target = options.target               # the directory where to modify the filenames
filter_files = options.filter         # the files filter
# and the options
opt_verbose = options.opt_verbose     # verbose or not
opt_dryclean = options.opt_dryclean   # execute the script or pretend to execute
opt_recursive = options.opt_recursive # recursivity or not

src_replace = ' '
dest_replace = '_'

######### functions #########

def list_files_directory(directory, filter_files):
	"""Rename the name of the directory and then filters its content."""
	# filter the files of the directory
	directory += os.sep + filter_files
	# load the arg_files from the folder 'arg_directory'
	files = glob.glob(directory)
	return files

def modify(name):
	"""Modify the filename : replace all the spaces by underscores and convert from upper to lower case."""
	return string.replace(name, src_replace, dest_replace).lower();

def move(files, dest):
	"""Move all the 'files' to the directory 'dest'."""
	for f in files:
		# retrieve the name of the file
		(path,name) = os.path.split(f)
		# to move it at the wished destination
		os.rename(f, dest + os.sep + name)

# main program
if os.path.isdir(target):
	# remove the trailing slash (has a strange behaviour if not removed)
	if target.endswith(os.sep):
		target = target[0:-1]
	# execute the main function
	# list the content of the directory
	files = list_files_directory(target, filter_files)
	# for each files found
	for f in files:
		if os.path.isdir(f):
			# if a directory, do nothing, all has already been done
			continue
		elif os.path.isfile(f):
			# we retrieve only the name of the file to work on it
			(path, name) = os.path.split(f)
			# we retrieve the artist's name and first name (before the -)
			# it will then become the name of the directory
			# if it doesn't already exist
			if name.find(' -') != -1:
				# retrieve the name of the artist (or group)
				artist = name.split(' -')[0]
				# for filtering files after
				filtrage = artist + ' -*'
				# if the name of the artist is separated by a ,
				if artist.find(',') != -1:
					artist_name = artist.split(',')
					artist = artist_name[0]
					if len(artist_name) > 0:
						artist += artist_name[1]
				# replace all spaces by "_" and upper case to lower case
				artist = modify(artist)
				# create the name of the maybe new directory
				dest = path + os.sep + artist
				# if the directory doesn't exist, we must create it
				if not os.path.isdir(dest):
					# create the directory
					os.mkdir(dest)
					# then list all the files from the directory
					# 'target' to move to the directory 'dest'
					files_to_move = list_files_directory(target, filtrage)
					print "mv " + filtrage + " " + dest
					# move files_to_move to the directory 'dest'
					move(files_to_move, dest)
				# relaunch a listing since the contents may have changed
				files = list_files_directory(target,filter_files)
			else:
				print "bad format, impossible to retrieve the artist's name for the file " + f

else:
	print "the target '" + target + "' is not a directory..."
	print "skipping..."
