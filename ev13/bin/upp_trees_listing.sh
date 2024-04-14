#!/bin/bash
##--trees/pathes-log  of up1 + t1 + varu (L1NW-evv-pathes)
set -u

date ; hostname ; uname -a
cd ${q_UppDP}/
##--start-DIRs for tree to log their trees :
dirList1="${q_UppDP}/   ${vaaruDP}/   ${TP1DP}/"


echo; echo;
echo -e "\n==================== $(date +%Y%m%d_%H%M%S) : ==============================="
echo "============ l1nw-trees/Dirs in 3 formats and each 4 Levels: ====================="
echo "     tree-levels-formatted +  tree-levels-unformatted/pathLine [+ out-commented: find -type d ] of: "
echo "     ${dirList1}  "
echo "___ for now:  out-commented find listing: find -type d ,and excluded w1_* in tree-logging! ___"
echo; echo;

echo "_________________ Trees formatted in several levels:  _______________"
echo "______________________________________________________________________"
echo
for dir1 in ${dirList1}  ; do
	echo "#################  $dir1 in 4 tree-levels-formatted : ###################"
	for ii in 1 2 3 4 ; do
		echo ================== Level $ii $dir1 :
		cd  $dir1 || exit 3
		tree  -I "w1_RF/"  -L $ii -adx  .
	done
done



echo "_________________ Trsee-Full-Pathes: _________________________________"
echo "______________________________________________________________________"
echo
for dir1 in ${dirList1}  ; do
	echo "#################  $dir1 in 4 tree-levels-unformatted : #################"
	for ii in 1 2 3 4 ; do
		echo ================== Level $ii $dir1 :
		cd  $dir1 || exit 3
		tree  -I "w1_RF/"  -L $ii -adx  -if  .
	done
done



echo "_________________ find-Full-Pathes of Dirs: find -type d _____________"
echo "______________________________________________________________________"
echo
	echo "#################  find ${dirList1}  -type d : raw : ##################"
echo "------ commented out: find ${dirList1}  -type d "   ##-II- too long. if needed, comment in!
