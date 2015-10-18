import os
import glob
import functools


def load_user_specific_patterns_from(filepath):
    """Load user's filters from a specific file.
    Args:
        filepath:  absolute file's path to load patterns from

    Returns:
        user's personal filters if existing, empty list otherwise.

    """
    if not os.path.isfile(filepath):
        return []

    return filter(lambda e: e != "",
                  open(filepath).readlines())


def files_from(directory, filter_files_pattern):
    """List the files from the directory using filter filter_files_pattern.

    Args:
        - directory: the directory to list files from.
        - filter_files_pattern: the filtering pattern to use.
    """
     # filter the files of the directory
    directory_exp_filter = os.path.join([directory, filter_files_pattern])
    # load the files from the folder 'directory'
    return glob.glob(directory_exp_filter)

def rename_according_to_naming_conventions(s, user_patterns):
    """Rename according to conventions:
      no ',', ';', ':', ' ' or '_' replaced by '-'

    Args:
        - s: string input
        - user_patterns: user provided patterns

    Returns:
        input transformed.

    """
    # 0 -> patterns source; 1 -> symbol that replace the patterns source
    patterns = ( (user_patterns, '')
                 ,(('          ', '        ', '       ', '     ', '    ', '   ', '  '), ' ')
                 ,((' \'', '_\'', '-\''), '\'')
                 ,((';', ':', '?', '!', ','), '')
                 ,(('()', '( )', '(  )', '{}', '{ }', '{  }', '[]', '[ ]', '[  ]'), '')
                 ,(('..........', '.........', '........', '.......', '......', '.....', '....', '...', '..'), '.')
                 ,((' _ ', ' - ', ' ', '_',
                    '__________', '_________', '________', '_______', '_____', '____', '___', '__',
                    '----------', '---------', '--------', '-------', '-----', '----', '---', '--'), '-'))
    reduce_fn = lambda res, pattern: modify_name(res, pattern[0], pattern[1])
    return functools.reduce(reduce_fn, patterns, s.lower())


def modify_name(s, src_replace, dest_replace):
    """Modify the filename: replace all the spaces by underscores
    and convert from upper to lower case.

    Args:
        - s
        - src_replace
        - dest_replace

    Returns:
        name modified.
    """
    reduce_fn = lambda result, symbol: result.replace(symbol, dest_replace)
    return functools.reduce(reduce_fn, src_replace, s)


def rename_foldername(full_old_name, user_patterns, dryrun, verbose):
    """Rename full_old_name to new. Returns the new_name once done."""
    (path, old_name) = os.path.split(full_old_name)
    new_name = rename_according_to_naming_conventions(old_name, user_patterns)
    if verbose: print("old_name: '" + old_name + "'\nnew name: '" + new_name + "'")
    if old_name != new_name:
        full_new_name = path + os.sep + new_name
        if not dryrun and not os.path.exists(full_new_name):
            os.rename(full_old_name, full_new_name) # to move it at the wished destination
        return full_new_name
    return full_old_name


def rename_filename(full_old_name, user_patterns, dryrun, verbose):
    """Rename full_old_name to new and returns the new one.

    Args:
        - full_old_name: old name to rename
        - user_patterns: user specific patterns
        - dryrun: do nothing
        - verbose: verbose mode

    Returns:
        The new name

    """
    (path, old_name) = os.path.split(full_old_name)
    (old_name_without_ext, old_filename_ext) = os.path.splitext(old_name)
    new_name = rename_according_to_naming_conventions(old_name_without_ext,
                                                      user_patterns)
    l = len(new_name)
    new_name = new_name[0: l - 1 if l > 1 else l] \
               if new_name.endswith('.') \
               else new_name

    if verbose:
        print("old name without ext: '%s'\nnew name without ext: '%s'" %
              (old_name_without_ext, new_name))

    if old_name_without_ext != new_name:
        full_new_name = os.path.join([path, new_name, old_filename_ext.lower()])
        if not dryrun and not os.path.exists(full_new_name):
            os.rename(full_old_name, full_new_name)
        return full_new_name
    return full_old_name


def rename_folder_and_its_files(target_dir, filter_files_pattern, user_patterns,
                                dryrun, verbose):
    """Rename the folder according to conventions.
    Applies it to its files too.

    Args:
        - target_dir: target directory to rename
        - filter_files_pattern: pattern of files to filter
        - user_patterns: some other user patterns
        - dryrun: do nothing but show what will be done
        - verbose: verbose mode

    Returns:
        The new name

    """
    new_target = rename_foldername(target_dir, user_patterns, dryrun, verbose)
    files = files_from(new_target, filter_files_pattern)
    for f in files:
        if os.path.isdir(f):
            if verbose:
                print("Folder: %s" % f)

            rename_folder_and_its_files(f, filter_files_pattern, user_patterns,
                                        dryrun, verbose)
        elif os.path.isfile(f):
            if verbose:
                print("File: %s" % f)
            rename_filename(f, user_patterns, dryrun, verbose)
        else:
            if verbose:
                print("Not a folder nor a file, skip.")


def scan_and_rename(file_or_folder, filter_files_pattern,
                    patterns_file,
                    recursive, dryrun, verbose):
    """Scan and rename file_or_folder's content according to naming
    conventions.

    """
    user_patterns = load_user_specific_patterns_from(patterns_file)

    if recursive and os.path.isdir(file_or_folder):
        rename_folder_and_its_files(file_or_folder, filter_files_pattern,
                                    user_patterns, dryrun, verbose)
    else:
        if os.path.isdir(file_or_folder):
            rename_foldername(file_or_folder, user_patterns, dryrun, verbose)
        else:
            rename_filename(file_or_folder, user_patterns, dryrun, verbose)
