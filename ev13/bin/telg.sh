#!/bin/bash

##--- finding Tels in ABs
##- USAGE: $0 <tel.nr.part> <pathes-to-grep> (whole number as one WORD WITHOUT any spaces/-/..... as 01729550633 !!
##- eg: telg.sh 20026363 /up1/mesp/MEs/WPad_m  /up1/w/docs_m/WPads_All/Dansies_wk/0PeopDansies_MEs

usage11="$0  <tel.nr.part--ONLY.Digits>  <pathes-to-grep>";
(( $# != 2 ))  && { echo "$usage11" ; exit 3 ; }
par1="$1" ; shift ;
nr1=""
for ((ii=0; ii<${#par1}; ii++)); do
	nr1="${nr1}${par1:ii:1}[)( /-]*"
done
##__  echo "------ grep TXTs + HTMLs for  nr1 of:  $nr1"  -----------------------------------------;
echo  "___________ TXT-files:  " ;  grep  --color=auto  -EiR      --include  "*.txt"   "$nr1"  "$@"
echo  "___________ HTM-files:  " ;  grep  --color=auto  -EiR  -l  --include  "*.htm*"  "$nr1"  "$@"

