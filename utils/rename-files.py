#!/usr/bin/env python

import os,string,glob
import argparse

######### parser #########

# parse the arguments/options of the script
parser = argparse.ArgumentParser(description='Process (recursively) files from a target folder to rename folder and files with convention (lower case and - separated).')
# optional
parser.add_argument('-t', '--target', dest='target_folder_or_file', nargs='?', default=".", help='Target file or folder to rename. Default to current folder.')
parser.add_argument('-f', '--filter', dest='filter_files' , nargs='?', default='*', help='Filter pattern on files to apply. Default to all files.')
# flags
parser.add_argument('-v', '--verbose'  , dest='verbose'  , default=False, action='store_const', const='True', help='Verbose output (default: false)')
parser.add_argument('-r', '--recursive', dest='recursive', default=False, action='store_const', const='True', help='Recursive (default: false)')

args = parser.parse_args()

######### functions #########

def files_from(directory, filter_files):
    """List the files from the directory using the filter filter_files."""
    directory_exp_filter = directory + os.sep + filter_files # filter the files of the directory
    return glob.glob(directory_exp_filter)                   # load the files from the folder 'directory'

def rename_according_to_naming_conventions(s):
    """Rename according to conventions (no ',', ';', ':', ' ' or '_' replaced by '-')."""
    return modify_name(modify_name(modify_name(s, (' \'', '_\'', '-\''), '\''), (',', ';', ':', '?', '!'), ''))

def modify_name(s, src_replace = ('          ', '        ', '       ', '     ', '    ', '   ', '  ',
                                  '__________', '________', '_______', '_____', '____', '___', '__',
                                  '----------', '--------', '-------', '-----', '----', '---', '--',
                                  ' _ ', ' - ', ' ', '_'), dest_replace = '-'):
    """Modify the filename : replace all the spaces by underscores and convert from upper to lower case."""
    for symbol in src_replace: s = s.replace(symbol, dest_replace);
    return s.lower();

def rename_filename(full_old_name, verbose):
    """Rename full_old_name to new. Returns the new_name once done."""
    (path, old_name) = os.path.split(full_old_name) # retrieve the name of the file
    new_name = rename_according_to_naming_conventions(old_name)
    if verbose: print("old_name: " + old_name + "\nnew name: " + new_name)
    if old_name != new_name:
        full_new_name = path + os.sep + new_name
        os.rename(full_old_name, full_new_name) # to move it at the wished destination
        if not os.path.exists(full_new_name):
        return full_new_name
    return full_old_name

def rename_folder_and_its_files(target, filter_files, verbose):
    """Rename the folder according to conventions. Applies it to its files too."""
    new_target = rename_filename(target, verbose)
    files = files_from(new_target, filter_files)
    for f in files:
        if os.path.isdir(f):
            if verbose: print("Folder: " + f)
            rename_folder_and_its_files(f, filter_files, verbose)
        elif os.path.isfile(f):
            if verbose: print("File: " + f)
            rename_filename(f, verbose)
        else:
            if verbose: print("Not a folder nor a file, skip.")

def scan_and_rename(file_or_folder, filter_files, recursive, verbose):
    """Scan and rename file_or_folder according to naming conventions."""
    if recursive and os.path.isdir(file_or_folder):
        rename_folder_and_its_files(file_or_folder, filter_files, verbose)
    else:
        rename_filename(file_or_folder, verbose)

scan_and_rename(args.target_folder_or_file, args.filter_files, args.recursive, args.verbose)
