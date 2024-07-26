#!/bin/bash
#
# convertsi + renames  the pre-mdCm-dnts-txt-file into new md1-evv-format :
# !! manual correction afterwards:  one  fold1Em cut + paste at the end-of-file !!
# ---
# eg-usage:  for ii in *.txt ; do dntsText_to_md1_convert.sh  "$ii" ; done ;
# eg-usage:  find . -xdev  -type f  -name '*.txt' -exec  dntsText_to_md1_convert.sh  {}  \;
#
set -u
fn11=${1:?"usage11:  $0 <filepath of xx_dnt.txt , to be converted/OVERWRITTEN to md1-evv>"}
##__ if NOT-overwriting:  fn11New="${fn11//.txt/.md}"
echo  "___ ${fn11} :"

##--II- separating EOL-insertes (in two sed-substitution-cmds) in two steps, so that this script is multiple anwendbar wothout side-effects !:
sed   -i.1sed  -e  '/^\s*$/d'  -e  "s/^======* */${q_fold1Em}\n${q_fold1Sm}/"  -e  "s/${q_fold1Em}/&\n\n/"  -e  "s/^--- */\n\t${q_fold12Sm}/"    ${fn11}
##sed  -e  '/^\s*$/d'  -e  "s/^======* */${q_fold1Em}\n${q_fold1Sm}/"  -e "s/${q_fold1Em}/&\n\n/"   -e 's/^--- */\n\t________:  /'   "$fn11"  > "$fn11New"
##__ either manualyy add the last q_fold1Em /OR (but-then-not-multiple-anwendbar): 
(echo  "${q_fold1Em}" ; echo ) >>   ${fn11}   ##--II-the first-one q_fold1Em is to delte manually !



##--II-alternative-1: --------------
#same-with-first-deleting-empty-lines  and then mv instead unique :()but then it is NOT multiple anwendbar !! :
#  sed  -i  -e  '/^\s*$/d'  -e  "s/^======* */${q_fold1Em}\n\n\n${q_fold1Sm}/"  -e 's/^--- */\n\t_____:  /'   "$fn11"
#  mv  -iv  "$fn11"   "${fn11//.txt/.md}"  
# /OR instead mv:     uniq   "$fn11" >  "${fn11//.txt/.md}"  ##--II-to remove multiple emty-lines into one! (instead putting it into sed-line! so is the script multiple anwendbar ohne sideeffects!)
##_____________________________________________________________________
#
