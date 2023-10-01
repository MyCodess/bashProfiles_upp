##-- dummy/test sc :

echo  "======= sc1-in-bin-dir =========";
##----------------------- w1-tar-full:
date;  cd ${vaarAuBups1DP}/ && cd /up1/mnt/T1fs/t1_RF/  &&  tar --one-file-system  -cpzvf "${vaarAuBups1DP}/bups1w/w1--$($cuds).tgz" "./w1_RF/"  >  "${vaarAuBups1DP}/bups1w/w1--$($cuds).tgz.log" ;  date ;
##----------------------- w1-increment-tar :
##__  cdlla  ${vaarAuBups1_P}/bups1w/  &&  tar -cpzvf   w1--newer--$($cuds).tgz   $(find /up1/w1/  -newer  ./w1--2*.tgz  -type f) > w1--newer--$($cuds).tgz.log ; chmod 666 w1-* ;
echo  "_______ END- sc1 _______________"
exit 0



################################ quickies-lager /cpd: #############################################
echo "___________ you may NOT have  seen this line!! PROBLEM if you see this !!! ____________"
exit 3
##-----------------------
## setfont /usr/share/kbd/consolefonts/880.cp.gz  -16
## setfont lat2-16 -m 8859-2
## setfont /usr/share/kbd/consolefonts/eurlatgr.psfu.gz
##-----------------------
##--USAGE1:  usage:  sudo -i "${q_BinDP}/syysTgStat.sh"  >> $syysTgStatsNtsFP  ;
##-----------------------





############################ cpd/prev/olds/....: ##################################################################
##--find all non-text-files : .... [[  "text/plain" != $(file -b --mime-type $1 ) ]]  && echo "$1  :  __NO_Plain_TXT__ " ;
##============= w-sync: =================================================================
##__export syc_from="/up1/w_RF"   &&  ls -l  ${syc_from}/  &&  \
##__export syc_to="/up1/w_CP_rw"  && ls -l  ${syc_to}/ && \
##__rsync -nv    -rtlHO --modify-window=5  --delete  ${syc_from}/  ${syc_to}/
##===--END1--## w-sync: =================================================================


##============= system/OS-tar-bup from "init 1" : =======================================
========== system/OS-tar-bup from "init 1" --> BUT better from a Live-/SystemRescueCD-media, then basically NOT even in init-1 but really offline/down:
-- here the steps ONLy if NOT doing system-bup from a Live-Media/SysREscueCD, but from init-1 (not checked/tested yet):
umount /up1/w  /up1/t1  /home  /up1/mnt/UUFS1  /up1/mnt/T1fs_loc
#--??- umount proc  run  sys
export vaarAuDP=/up1/mnt/VARUfs/1503ubt/varu/varau
cdvarau
cdlla /up1/mnt/VARUfs/1503ubt/varu/varau/bupsvar/

export tarFN="$($cuds)-system-offline-${syysTg}-${q_Hostname}.tgz" ;
tar --one-file-system   --exclude-caches  --exclude-tag="${q_NoBupFlagFN}"  --show-omitted-dirs --checkpoint 5000  -cpzvf  "${tarFN}"   $@   2>&1 1>tared-output.log  |tee tared-err.log     ##--II-see ONLY errors, but both err+out are logged.
##===--END1--#### system/OS-tar-bup from "init 1" : ======================================


##========== putNoBupFlag for /home/-tree: ===============================================
find /home/  -type d  \( -iname "*trash*" -o -iname "tmp" -o -iname "*thumbnails*" -o -iname "*cach*" -o -iname .chmsee -o -iname .beagle -o -iname .adobe -o -iname .macromedia \) -exec putNoBupFlag.sh {}  \;
echo;echo;
echo "============ Check-Listing-1 : ------------- ";
findin  /home  ${q_NoBupFlagFN}   -ls  ;  ##--/OR  find /home \( -iname "*trash*" -o -iname "*cach*" -o -iname "tmp" \) -a -type d -ls ; 
##--========== __END1__-putNoBupFlag for /home/-tree ----------- 


################ bups/tars : =================================================================
##--- etcu-bup:
##_ echo tar --one-file-system  -cpzvf  "${bups1LocalDP}/$($cuds)_etcu_${q_Hostname}_tz"  "${ettcuDP}"/* 
##_   updateBupFlagFile  "${bups1LocalDP}"  "etcu_bups.flg"
##======== bup/copy tx_RF -> tx_BP:
#date; cp -a /up1/media/D03P2/t2_RF   /up1/media/D04P2/tx_BP/t2_BP  ; date
#date; cp -a /up1/media/D03P2/t3_RF   /up1/media/D04P2/tx_BP/t3_BP  ; date
#date; cp -a /up1/media/D03P2/t4_RF   /up1/media/D04P2/tx_BP/t4_BP  ; date
#=========
####--END1--##### bups/tars : =================================================================


