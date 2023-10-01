#!/bin/bash
set -u
##---------- USAGE1:  eg.   (-s == simulation ! remove -s for not-simulation):
##-->best+fast (a bit less names-verifying than No-fast-version/alnum, but OK! main-work-done! ):
##--   find .  -depth  -regextype posix-extended \( -ipath "*ProgsRes*" -o -ipath "*/Moz_*" -o -ipath "*Imgs_L1NWs*" \) -prune -o   -regex  ".*[^[:alnum:]/_.-].*"   -exec renFilesEvv.sh -sv {} \;   ##--longVer-with-excludes
##--   find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"   -exec renFilesEvv.sh -sv {} \;   ##--shortVer-ueberschaubarer
##-----more-usage-alternatives:
##	find .  -depth  -exec renFilesEvv.sh -sv {} \;
##  exclusive evv-exceptions:    find .  -depth  \( -ipath "*/Moz_*" -o -ipath "*Imgs_L1NWs*" \) -prune -o -exec renFilesEvv.sh -sv {} \;
##	fast version:  find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"   -exec renFilesEvv.sh -sv {} \;
##	fast version--full-with-exceptions:
##--more(prev:
##  for whole MEs:    find .  -depth  -ipath "*/Moz_*"  -prune -o -exec renFilesEvv.sh -sv {} \;
##  for whole tx:     find .  -depth  -ipath "*Imgs_L1NWs*"  -prune -o -exec renFilesEvv.sh -sv {} \; 
##---------------------------------------------------------------

##---------- hists: ----------------
##-- 100312	:  MPs-considering !! MUST be able to executed on MPs_1kk !! so first adaption: accepting --- instead -- in evEnv-namings !
##-- 150401-new-release:  changing "_" evv-delimiters into "-" globally (also -- instead __ , ...)  ##--> 2check/2do: MPs-names/-delimiters as ---,.. !?!?
##---------------------------------------------------------------

##--II-!!2do/2check maybe replace almost all the following by online-bash-replacement:  v11='_.-ab+bc-cd?de#11: 22;33-'   ;  echo "${v11//[^[:alnum:]_.-]/8}"  ##mayebe also plus last step of misCombinations !? BUT see if okay for MOs/VIDs-kk-conventions !? /_171127

##---------- nts: renaming files/dirs/... according to the evEnv-Filenameing-kk : for ALL files (was based on MPs-renaming, so still mp-sruff there, but OK!)
##--II- the sequence of sed-replacements is very relevant!! if needed, invoke this script several times on the same tree!!
##--II- replacing ^[:alnum:]  depends also on your current char.code!!! so mayebe different results in different ENVs!! here: suse114--utf8 !!
##--II- space-removing is in multiple lines (redundant) but OK! so better!
##--II- be carefull with evEnv-delimiters as _ , __ do NOT modify/remove or add them! ONLY delimiters handeld here are _ bzw. __
##--II- acts/renames ONLY on final FILENAME itself, not the whole path, even if the whole path is as cmdline-param!!
##--!?- !! maybe have to manually replace ' and ` before running this script !?
##--II-! evEnv-permitted-chars only:  [:alnum:]_.-    : AND aslo respecting the delimiters as _ , __
##---------------------------------------------------------------


tstamp="$($cuds)"  ##--II- NOT datetime, due to find-call!
getoptsdef3 $@ ; shift $(($OPTIND - 1)) ;
param1="${1:?USAGE: ${myFN} [-lsv] <FileName/Path> with -s: simulation/dry, -l: create-logfile, -v: verbose}" 
##

param1="./${param1}"         ##-i-  must contains at list one "/" due to builing dpOrg later here!
param1="${param1%/}"         ##-i-  if any final char "/" then truncate it, as eg in ./dir1/
dpOrg="${param1%/*}"
fnOrg="${param1##*/}"        ##__ echo $dpOrg ; echo $fnOrg ; exit;
fnNew="$fnOrg"

##--I- removing spaces (avoiding generating  __ delimiters by repaĺacing-aciotns):
fnNew="$(echo "$fnNew" | sed -e 's/[-_.]  */-/g' -e 's/  *[-_.]/-/g'  -e 's/  */-/g' )"

##--I- removing special-chars as "&(" ..., and their spaces (avoiding generating  __ delimiters by repaĺacing-aciotns): !!mybe handling ' or ` manually!!??
fnNew="$(echo "$fnNew" | sed -e 's/-*\&-*/-N-/g' -e 's/(/-/g' )"

##--I- removing non-alnums1.evv , but avoiding cases like __@_ , _@__ , ..., AND keep the delimiters/second.delimiter  __ without generating new "__" ones, SPECIALLY for MPs or VIDs:
##--I- sed-nts:  in a range-spece [... ]  :  "-" as char-item MUST be tha last or first as [xyz-] ! "]" as char-item MUST be the first in range-spece as []xyz]
fnNew="$(echo "$fnNew" | sed -e 's@_[^[:alnum:]/_. -]@-@g' -e 's@[^[:alnum:]/_.-]-@-@g'  -e 's@[^[:alnum:]/_.-]@-@g' )"

##--I- removing misCombinations generated in the previous steps:
fnNew="$(echo "$fnNew" | sed -e 's/  */-/g' -e 's/---*\./\./g' -e 's/\.\.*/./g' -e 's/\.-/-/g' -e 's/-$//' -e 's@----@--@g' -e 's@-*----*-*@---@g' -e 's/-\{4,\}/--/g' -e 's@\.MP3@\.mp3@' )"

##--I- Cosmetics: Beginning of filename/artis handling (The-..., ...)
##--?- sometimes. eg YT-vids, prefere to keep it!?:     fnNew="$(echo "$fnNew" | sed -e 's/^[Tt]he_//' )"

##-- renaming:
if [[ "$fnOrg" != "$fnNew" ]] ; then
	(( $simulit == 0 )) &&   cmd1="mv -iv " || cmd1="echo ____ " ;
	${cmd1}  "${dpOrg}/${fnOrg}"  "${dpOrg}/${fnNew}" | tee -a ${logFN}
	(( $verboseit > 0 )) && echo -e "    $dpOrg :\n    $fnOrg \n    $fnNew \n ========" | tee -a ${logFN}
fi

##-- renaming--ok-var.2:
#[ \( "$fnOrg" != "$fnNew" \) -a  \( "$renameFlag" == "doit" \) ] &&  mv -iv  "$fnOrg"  "$fnNew" | tee -a ${logFN}
##-- debug.info / simulation:
#[[ "$fnOrg" != "$fnNew" ]] &&  echo -e "    $fnOrg \n    $fnNew \n ========"

[[ -e ${logFN}  ]] && echo "=========== finished renamings $(date +%Y%m%d-%H%M%S) , $(date) =================" >> ${logFN}

