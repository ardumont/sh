#!/bin/bash

# conversion command
PDFTK=$(which pdftk)
# working directory (where the files to convert are)
WDIR=$1
# filename of the form to fill in
FORM_INPUT=$2
# prefix for the output file based on the input filename
PREFIX_FILE_OUTPUT="$(basename $FORM_INPUT)"

cd $WDIR

for i in $(ls *.fdf); do
    #
    echo "file to convert : $i";
    # compute the name of the output file
    OUTPUT_FILENAME=$PREFIX_FILE_OUTPUT.$(basename $i).pdf
    echo "$PDFTK $FORM_INPUT fill_form $i output $OUTPUT_FILENAME";
    # execute the conversion
    $PDFTK $FORM_INPUT fill_form $i output $OUTPUT_FILENAME
done

