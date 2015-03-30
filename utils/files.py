import os,string,glob
import argparse
import functools

def load_user_specific_patterns_from(filename):
    """Load user's filters from a specific file. Return ths user's filters if existing, empty list otherwise."""
    return filter(lambda e: e != "", open(filename).read().split("\n")) if os.path.isfile(filename) else []

def files_from(directory, filter_files_pattern):
    """List the files from the directory using the filter filter_files_pattern."""
    directory_exp_filter = directory + os.sep + filter_files_pattern # filter the files of the directory
    return glob.glob(directory_exp_filter) # load the files from the folder 'directory'

def rename_according_to_naming_conventions(s, user_specific_patterns):
    """Rename according to conventions (no ',', ';', ':', ' ' or '_' replaced by '-')."""
    # 0 -> patterns source; 1 -> symbol that replace the patterns source
    patterns = ( (user_specific_patterns, '')
                 ,(('          ', '        ', '       ', '     ', '    ', '   ', '  '), ' ')
                 ,((' \'', '_\'', '-\''), '\'')
                 ,((';', ':', '?', '!', ','), '')
                 ,(('()', '( )', '(  )', '{}', '{ }', '{  }', '[]', '[ ]', '[  ]'), '')
                 ,(('..........', '.........', '........', '.......', '......', '.....', '....', '...', '..'), '.')
                 ,((' _ ', ' - ', ' ', '_',
                    '__________', '_________', '________', '_______', '_____', '____', '___', '__',
                    '----------', '---------', '--------', '-------', '-----', '----', '---', '--'), '-'))
    return functools.reduce(lambda result, pattern: modify_name(result, pattern[0], pattern[1]), patterns, s.lower())

def modify_name(s, src_replace, dest_replace):
    """Modify the filename : replace all the spaces by underscores and convert from upper to lower case."""
    return functools.reduce(lambda result, symbol: result.replace(symbol, dest_replace), src_replace, s)

def rename_foldername(full_old_name, user_specific_patterns, dryrun, verbose):
    """Rename full_old_name to new. Returns the new_name once done."""
    (path, old_name) = os.path.split(full_old_name) # retrieve the name of the file
    new_name = rename_according_to_naming_conventions(old_name, user_specific_patterns)
    if verbose: print("old_name: '" + old_name + "'\nnew name: '" + new_name + "'")
    if old_name != new_name:
        full_new_name = path + os.sep + new_name
        if not dryrun and not os.path.exists(full_new_name):
            os.rename(full_old_name, full_new_name) # to move it at the wished destination
        return full_new_name
    return full_old_name

def rename_filename(full_old_name, user_specific_patterns, dryrun, verbose):
    """Rename full_old_name to new. Returns the new_name once done."""
    (path, old_name) = os.path.split(full_old_name) # retrieve the name of the file
    (old_name_without_ext, old_filename_ext) = os.path.splitext(old_name) # retrieve the name of the file
    new_name = rename_according_to_naming_conventions(old_name_without_ext, user_specific_patterns)
    l = len(new_name)
    new_name = new_name[0: l - 1 if l > 1 else l] if new_name.endswith('.') else new_name
    if verbose: print("old_name_without_ext: '" + old_name_without_ext + "'\nnew_name_without_ext: '" + new_name + "'")
    if old_name_without_ext != new_name:
        full_new_name = path + os.sep + new_name + old_filename_ext.lower()
        if not dryrun and not os.path.exists(full_new_name):
            os.rename(full_old_name, full_new_name) # to move it at the wished destination
        return full_new_name
    return full_old_name

def rename_folder_and_its_files(target, filter_files_pattern, user_specific_patterns, dryrun, verbose):
    """Rename the folder according to conventions. Applies it to its files too."""
    new_target = rename_foldername(target, user_specific_patterns, dryrun, verbose)
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
        if os.path.isdir(file_or_folder):
            rename_foldername(file_or_folder, user_specific_patterns, dryrun, verbose)
        else:
            rename_filename(file_or_folder, user_specific_patterns, dryrun, verbose)
