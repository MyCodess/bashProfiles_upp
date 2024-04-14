#!/bin/bash
##-I- very indiviual handling/listing of l1nw-dirs for recreating, but only the more relevant/main ones!
##-!- output must be usable for "mkdir" , so not too many echo and also no empty lines!!
set -u

echo "##========= $(date) , generated by: $0 ============="



cd  ${TP1DP}
echo   "##========== ${TP1DP} : =========="
dirlist1=$(ls ${TP1DP}/)
for ii in $dirlist1 ; do
	case $ii in
		w|w_RF|tmp|lag)  find $ii -maxdepth 0 -type d ;;
		nps)    find $ii  -maxdepth 3 -type d ;;
		packs)  find $ii  -maxdepth 1 -type d ;;
		sy1)   find $ii  -maxdepth 3 -type d ;;
		tr)     find $ii  -maxdepth 2 -type d ;;
		varu)   find $ii  -maxdepth 2 -type d ;;
	esac
done  | sort
echo "##======================================================"


cd  ${vaaruDP}
echo "############################################################"
echo   "##========== ${vaaruDP} : =========="
dirlist1=$(ls ${vaaruDP}/)
for ii in $dirlist1 ; do
	case $ii in    ## now all same -maxdepth , but keep it so for later variations!!
		varau)  find $ii -maxdepth 1 -type d  ; echo "varau/bupsvar/logs" ;;      ##-2do-was: prjs + wks mitnehmen als tar???       ##-I- /OR just "ls" 
		syysvar) find $ii -maxdepth 1 -type d  ;; 
		*)      find $ii -maxdepth 1 -type d  ;;  ## rest is needed but must be tared, if want latest!
		## prev.variant with smaller varux:  *) find $ii -regextype posix-extended  -iregex ".*cache.*" -print  -prune -o  -type d -print ;;
	esac
done  | sort
echo "##======================================================"

