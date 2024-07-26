#!/bin/bash

##-- do  OCR on images/fotos (eg: scanned documents) and convert them to sPDF/searchable-PDFs
USAGE1="===USAGE for converting images into searchable-PDFs:\n   ${0##*/}  <images-fotos-filenames ... >";
(( $# < 1 ))  && { echo -e "\n $USAGE1 \n" ; exit 3 ; }    ##--OR:    dummy1="${1:?$USAGE1}"


for ii in "$@"; do
	prefix1=${ii%.*}
	##-- do OCR and output the texts in HOCR/html-format:
	cuneiform -l ger -f hocr -o "${prefix1}".hocr  "$ii"
	##-- convert the image-file + its hocr-text-file from last step into a searchable-PDF file:
	hocr2pdf  -i "$ii"  -o "${prefix1}".pdf < "${prefix1}".hocr
done


##-- comment this out, if merging of produced pages not needed:
#- pdftk   *.pdf   cat  output   out1.pdf

