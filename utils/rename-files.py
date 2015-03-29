#!/usr/bin/env python

import os,string,glob
import argparse

######### parser #########

# parse the arguments/options of the script
parser = argparse.ArgumentParser(description='Process (recursively) files from a target folder to rename folder and files with convention (lower case and - separated).')
# optional
parser.add_argument('-t', '--target'            , dest='target_folder_or_file'      , nargs='?', default=".", help='Target file or folder to rename. Default to current folder.')
parser.add_argument('-f', '--filter'            , dest='filter_files_pattern'       , nargs='?', default='*', help='Filter pattern on files to apply. Default to all files.')
parser.add_argument('-u', '--user-file-patterns', dest='user_file_specific_patterns', nargs='?', default='' , help='The user\'s file containing the specific patterns to remove when renaming filenames.')
# flags
parser.add_argument('-v', '--verbose'  , dest='verbose'  , default=False, action='store_const', const='True', help='Verbose output (default: false)')
parser.add_argument('-r', '--recursive', dest='recursive', default=False, action='store_const', const='True', help='Recursive (default: false)')
parser.add_argument('-n', '--dry-run',   dest='dryrun'   , default=False, action='store_const', const='True', help='Dry run (default: false)')

args = parser.parse_args()

######### functions #########

def load_user_specific_patterns_from(filename):
    """Load user's filters from a specific file. Return ths user's filters if existing, empty list otherwise."""
    if os.path.isfile(filename):
        return filter(lambda (e): e != "", open(filename).read().split("\n"))
    else:
        return [];

def files_from(directory, filter_files_pattern):
    """List the files from the directory using the filter filter_files_pattern."""
    directory_exp_filter = directory + os.sep + filter_files_pattern # filter the files of the directory
    return glob.glob(directory_exp_filter)                   # load the files from the folder 'directory'

def rename_according_to_naming_conventions(s, user_specific_patterns):
    """Rename according to conventions (no ',', ';', ':', ' ' or '_' replaced by '-')."""
    s0 = modify_name(s.lower(), user_specific_patterns, '')
    s1 = modify_name(s0, ('          ', '        ', '       ', '     ', '    ', '   ', '  '), ' ')
    s2 = modify_name(s1, (' \'', '_\'', '-\''), '\'')
    s3 = modify_name(s2, (';', ':', '?', '!'), '')
    s4 = modify_name(s3, ('()', '( )', '(  )', '{}', '{ }', '{  }', '[]', '[ ]', '[  ]'), '')
    s5 = modify_name(s4, ('..........', '.........', '........', '.......', '......', '.....', '....', '...', '..'), '.')
    return modify_name(s5, (' _ ', ' - ', ' ', '_',
                            '__________', '_________', '________', '_______', '_____', '____', '___', '__',

                            '----------', '---------', '--------', '-------', '-----', '----', '---', '--'), '-')

def modify_name(s, src_replace, dest_replace):
    """Modify the filename : replace all the spaces by underscores and convert from upper to lower case."""
    return reduce(lambda result, symbol: result.replace(symbol, dest_replace), src_replace, s)

def rename_filename(full_old_name, user_specific_patterns, dryrun, verbose):
    """Rename full_old_name to new. Returns the new_name once done."""
    (path, old_name) = os.path.split(full_old_name) # retrieve the name of the file
    new_name = rename_according_to_naming_conventions(old_name, user_specific_patterns)
    if verbose: print("old_name: '" + old_name + "'\nnew name: '" + new_name + "'")
    if old_name != new_name:
        full_new_name = path + os.sep + new_name
        if not dryrun:
            if not os.path.exists(full_new_name):
                os.rename(full_old_name, full_new_name) # to move it at the wished destination
        return full_new_name
    return full_old_name

def rename_folder_and_its_files(target, filter_files_pattern, user_specific_patterns, dryrun, verbose):
    """Rename the folder according to conventions. Applies it to its files too."""
    new_target = rename_filename(target, user_specific_patterns, dryrun, verbose)
    files = files_from(new_target, filter_files_pattern)
    for f in files:
        if os.path.isdir(f):
            if verbose: print("Folder: " + f)
            rename_folder_and_its_files(f, filter_files_pattern, user_specific_patterns, dryrun, verbose)
        elif os.path.isfile(f):
            if verbose: print("File: " + f)
            rename_filename(f, user_specific_patterns, dryrun, verbose)
        else:
            if verbose: print("Not a folder nor a file, skip.")

def scan_and_rename(file_or_folder, filter_files_pattern, user_file_specific_patterns, recursive, dryrun, verbose):
    """Scan and rename file_or_folder according to naming conventions."""
    user_specific_patterns = load_user_specific_patterns_from(user_file_specific_patterns);

    if recursive and os.path.isdir(file_or_folder):
        rename_folder_and_its_files(file_or_folder, filter_files_pattern, user_specific_patterns, dryrun, verbose)
    else:
        rename_filename(file_or_folder, user_specific_patterns, dryrun, verbose)

scan_and_rename(args.target_folder_or_file
              , args.filter_files_pattern
              , args.user_file_specific_patterns
              , args.recursive
              , args.dryrun
              , args.verbose)
