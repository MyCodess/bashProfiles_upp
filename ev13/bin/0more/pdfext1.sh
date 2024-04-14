#!/bin/bash

##-- extract some PDF-pages and write them to a new file (like pdftk, but now pdftk is NOT working on ubuntu 18.04 )
##--ToDo-!! /Problem:  if eg from page 8 to 11 , then the rheinfolge of pafes by unite is not correct, due to one-digit and two-digits sort on the shell eith * in: pdfunite  aa-*.pdf  ... !!

myname11="${0##*/}"
USAGE1="USAGE:  ${myname11}  <pdf-input-org-source-file>  <first-page-to-extract>  <last-page-to-extract>  <title-text> " ;
(( $# < 4 ))  && { echo "$USAGE1" ; exit 3 ; }

pdfseparate "$1"  -f "$2" -l "$3"  aa-%d.pdf ;
pdfunite  aa-*.pdf  bb1.pdf;
outfile11="${1%.pdf}--${2}-${3}--${4// /-}.pdf"
mv -i -v  bb1.pdf   "${outfile11}" ;
rm aa-*.pdf
echo "see the output file   ${outfile11} !"

