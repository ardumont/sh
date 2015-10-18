#!/usr/bin/env python3

import argparse
import files

######### parser #########

# parse the arguments/options of the script
parser = argparse.ArgumentParser(
    description="""Process (recursively) files from a target folder to rename
folder and files with convention (lower case and - separated).""")

# optional
parser.add_argument('-t', '--target',
                    dest='target_folder_or_file',
                    nargs='?',
                    default=".",
                    help="""Target file or folder to rename.
Default to current folder.""")

parser.add_argument('-f', '--filter',
                    dest='filter_files_pattern',
                    nargs='?',
                    default='*',
                    help="""Filter pattern on files to apply.
                    Default to all files.""")

parser.add_argument('-u', '--user-file-patterns',
                    dest='user_file_specific_patterns',
                    nargs='?',
                    default='' ,
                    help="""The user's file containing the specific patterns to
remove when renaming filenames.""")

# flags
parser.add_argument('-v',
                    '--verbose',
                    dest='verbose',
                    default=False,
                    action='store_const',
                    const='True',
                    help='Verbose output (default: false)')
parser.add_argument('-r',
                    '--recursive',
                    dest='recursive',
                    default=False,
                    action='store_const',
                    const='True',
                    help='Recursive (default: false)')
parser.add_argument('-n',
                    '--dry-run',
                    dest='dryrun',
                    default=False,
                    action='store_const',
                    const='True',
                    help='Dry run (default: false)')

args = parser.parse_args()
files.scan_and_rename(args.target_folder_or_file,
                      args.filter_files_pattern,
                      args.user_file_specific_patterns,
                      args.recursive,
                      args.dryrun,
                      args.verbose)
