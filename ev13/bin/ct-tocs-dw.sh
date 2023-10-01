#!/bin/bash
#
## DW-CT-TOCs as EIMPLE-webpage-HTML-ONLY, without ANY images/... to convert them to TXT for grep-search ...
#
##--II- Nacharbeit: converting to one-TXT-file (latest edition at the END ! so grep/Search from END to first line!):
##-converting to txt later on:  for ii in *.html; do html2text  --ignore-emphasis --ignore-links  --ignore-images  --dash-unordered-list "${ii}" > "${ii}.txt"; done; 
##-putting all into one file:  (for ii in *.txt; do echo "${q_fold1Sm} ${ii} ==================================="; cat "${ii}"; echo "${q_fold1Em}"; echo; done) > ../CT-TOCs-All.txt
#

year11=2019
lastNo=26

mkdir ${year11} ;  cd ${year11} ;
for (( ii=1 ; ii <= 26 ; ii++ )); do  wget  robots=off  --no-prox  --timestamping  --adjust-extension  --convert-links  --no-parent  --relative  --restrict-file-names=windows,ascii  -U  'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'  https://www.heise.de/select/ct/${year11}/${ii} ; done
for ii in ?.html; do mv -iv ${ii}   0${ii} ; done ;
for ii in *.html; do mv -iv ${ii}   ${year11}-${ii} ; done
