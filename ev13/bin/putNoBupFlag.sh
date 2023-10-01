#!/bin/bash
##-- put noNupFlag-file in the target DIR (cache,tmp,...) $1, to exclude it from bup/tars.
##--ii- due to find.-exec-call, did NOT work as function (.bashrc not invoked??), so MUST be a script !!

##--!! USAGE.eg.OK!: su - ;  find /home/  -type d  \( -iname "*trash*" -o -iname "tmp" -o -iname "*thumbnails*" -o -iname "*cach*" -o -iname .chmsee -o -iname .beagle -o -iname .adobe -o -iname .macromedia \) -exec putNoBupFlag.sh {}  \;
##--	check: find /home \( -iname "*trash*" -o -iname "*cach*" -o -iname "tmp" \) -a -type d -ls ; /OR  findin . ${q_NoBupFlagFN}   -ls  ;
set -u
targetDir1=${1:?"USAGE: ... <target-dir to be excluded from tar.>"} ;
cp -v $q_NobupFlagTplFP  ${targetDir1}/${q_NoBupFlagFN}  &&  chown -v --reference="${targetDir1}"  "${targetDir1}/${q_NoBupFlagFN}";

