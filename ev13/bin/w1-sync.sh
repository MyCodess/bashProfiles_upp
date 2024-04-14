#!/bin/bash
set -u
##--  using for syncing   w1_RF to  w1_BP

##--!!---------  using -a  :  use it with --no-p , so  rsync -n  -av  --no-p ... !! due to:
##-- 	the problem-param   by -a (which equals -rlptgoD ) is eigentlich the -p (keep-permissions) , because usu.  the w1_RF and w1_BP are mounted differently or different filesystems ,...
##-- 	if using -a instead "-rtlHO --modify-window=5" , then turn permissons off with  --no-p  , and/or sudo it, to set permissions if possible (not-always-possible)!!
##--	/OR best both MUST be mounted with same permissions!! w1_RF and w1_CP ! if needed, umount the automount and remount it!!!
##-------------
##--!!-if problems, add -i to rsync params for:  -i, --itemize-changes       output a change-summary for all updates

myname11="${0##*/}"
export dry11="${dry11:-  -n}" ;
##-2DO: better way, setting dry11=NO for dry!:   [[ ${dry11^^} = "NO" ]] && dry11=" " || dry11="-n"  ##--/OR: [[ $dry11 == "NO" ]] && dry11="" || dry11="-n" ; export dry11 ;
export params11="${params11:- }" ;
export syc_from="${syc_from:-${w1DP}/}"  ;
##__ to-t1-loc   :  export syc_to="${syc_to:-/up1/t1/w1_BP/}" ;
##__ to-MED1     :  export syc_to="${syc_to:-/up1/media/MED1_RF/w1_CP/}" ;
##__ to-BUPS1MD1 :    
export syc_to="${syc_to:-${q_Bups1Med1DP}/bups1w/w1_BP/}" ;

USAGE1="[ dry11=' ' params11='-u -x -y ...' syc_from='xxx'  syc_to='yyy' ]   ${myname11} " ; #see default values for these VARs!, also default is DRY (so NOT doing rsync) otherwise set it to empty with dry11="  " !
echo  "_____________________________________________________________________"; echo;
echo  "USAGE1:   $USAGE1" ; 
echo  "USAGE1-eg--not-DRY-and-only-update:   dry11=' '  params11='-u'   ${myname11} " ;
echo  "could-do-manually-pre:  rm -rf  ${syc_to}/docs_m/WPads_All/WPad/  ;  cp -a  ${syc_from}/docs_m/WPads_All/WPad/  ${syc_to}/docs_m/WPads_All/  " ;
echo  "______________________________________________________________________"; echo;

echo "================ w1-sync: ${dry11}    =========================================="
echo; echo "_______ sync-SOURCE/from:  ${syc_from} :  _________"
ls -l  ${syc_from}
echo; echo "_______ sync-TARGET/to:    ${syc_to}   : __________"
ls -l  ${syc_to}

##--II-fat-rsync :   ------------------------------------------
##__  variation1--OK:    
cmd11="rsync  ${dry11}  -v -rtlHO --modify-window=5  --delete  ${params11}   ${syc_from}  ${syc_to}" ;
##__  variation2--with -a --no-p : cmd11="rsync  ${dry11}  -av  --no-p  -H --delete  ${params11}   ${syc_from}  ${syc_to}" ;
##--II-ok-NTFS-rsync :   rsync  ${dry11}  -v -a  --delete  --modify-window=5  ${syc_from}  ${syc_to}
echo;echo;
echo "_______ ${cmd11}  _____________" ;
##__   
read -p "OK? [ ENTER /OR ctrl-C ]  " ;
${cmd11}
echo; echo "===__END1__===== w1-sync ${dry11}   =========================================="

cat <<outtext1
	manually do update your sync-flg + bupsFlag files and rsync again, as :
	syncFlagUpdate   "${syc_from}"   "${syc_to}"  ;
	bupsFlagUpdate  "${syc_to}"  "w1_bups.flg" ; ${cmd11} ;
outtext1

