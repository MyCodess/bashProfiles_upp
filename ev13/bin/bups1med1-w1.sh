#!/usr/bin/bash  -i

##---- copies bups1-files + w1 syc to the external bups1-Media/q_Bups1Med1DP  ! so basically rsync bupsvar1 + w1 and updating their flag/syc-files!
##--REQ-pre , do manually:  bupsvar1 MUST be mounted!:  mount /up1/media/HDD11
##--REQ-chk1:  clean bupsvar1 of too many bups ...!
##--II-  if problems, add -v or -x to bash !!
##--!!- due to "set -e" if minor errors, as listing a dir by bupsFlagUpdate() or so ..., the script is abruptly terminated/abgebrochen ! so to avoid it could either run this as root /OR remove set -e/-u !?
##--    eg-abgebrochen: reading lost+found-DIRs of root by bupsFlagUpdate() or so ...! but for now all OK!

set  -o  nounset  ##== set -u
set  -o  errexit  ##== set -e
set  -a
##__ Alternative-1-cmds (simulation): 
pauseCmd1="echo ; read -p  ===============================if-OK-Enter================"
rsyncCmd1="rsync  -n  -av"
##__ Alternative-2-cmds (NO-simulation): 
pauseCmd1="echo ; echo   ==_______________________________________ next-step: _____________=="
rsyncCmd1="rsync  -av"

cd  ${vaarAuBups1DP}  || { echo "$q_fatalErrorTag  prereq:  mount-the-bups1-source: ${vaarAuBups1DP} " ; exit 5 ; }

echo "====================== mounting MED1 : ========================"
##__ 
mount -vl | grep -i ${q_Bups1Med1DN}  || mbups1med1 ;
cdbups1med1 ;
$pauseCmd1

##--II-due to rsyn-cmds leave this EnvVars withOUT slash at the end !! as src/dest/.... !

echo "====================== bupsvar1 rsync : ======================="
bupsvar1_src="${vaarAuBups1DP}"
bupsvar1_dest="${q_Bups1Med1DP}/bups1/bupsvar1"
bupsvar1_bupsFlagFN=bupsvar1_bups.flg
##--??-if-wanted-extra-step:   rsync  -n  -av    "${bupsvar1_src}/sy1/"   "${bupsvar1_dest}/sy1/"  ;  ##--just to have less updates in the next step! mehr Ueberblick! otherwise is included in next step!:
${rsyncCmd1}    "${bupsvar1_src}/"        "${bupsvar1_dest}/"       ;
syncFlagUpdate    "${bupsvar1_src}/"        "${bupsvar1_dest}/";
bupsFlagUpdate    "${bupsvar1_dest}/"       "${bupsvar1_bupsFlagFN}"  "on-Bups1Med1"   "on-Bups1Med1-done1";
$pauseCmd1

echo "====================== w1 rsync :      ========================"
w1_src="${w1DP}"
w1_dest="${q_Bups1Med1DP}/bups1w/w1_BP"
w1_bupsFlagFN=w1_bups.flg
dry11=' '  syc_to=${q_Bups1Med1DP}/bups1w/w1_BP/    w1-sync.sh ;   ##--/OR BUT it resyncs latest DIRs-attribs again!:  : ${rsyncCmd1}  --delete    "${w1DP}/"     "${w1_dest}/" ;
syncFlagUpdate   "${w1DP}/"     "${w1_dest}/" ;
bupsFlagUpdate   "${w1_dest}/"  "${w1_bupsFlagFN}"   "on-Bups1Med1"   "on-Bups1Med1-done1";
$pauseCmd1


echo "===== bupsFlags and syncFlags for the whole/root of bups1med1 ${q_Bups1Med1DP}: =====" ;
bupsFlagUpdate        "${q_Bups1Med1DP}/"  "bups1Medias-all.flg"    "on-Bups1Med1"   "on-Bups1Med1-done1";
##--bups1med1 has NO-Direct-sync-DIR , so here just a manual sync-file there as timeStamp!! :
el1d  " ___bups1med1-rsync-done___ :   "      >>  ${q_Bups1Med1DP}/${syncFlagFN} ;  ##--just-a-ntsFlg-there-in-root-of-q_Bups1Med1DP

echo "===== sync media  bups1med1 : ====="
cd;
sync;sync;sync;
read -p  "============ un-mount-med1 [y/n]?  n: "  v11 ; un_mount11=${v11:=n} ; echo "__un_mount11 is : $un_mount11 _____" ; [[ $un_mount11 == "y" ]] && umount -v /up1/media/BUPS1MD1 ;
echo "===================== __1done!  manually un-mount bupsvar1 ==========================";echo;
