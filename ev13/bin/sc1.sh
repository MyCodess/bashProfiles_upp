##-- dummy/test sc :

echo  "======= sc1-in-bin-dir =========";

echo  "_______ END- sc1 _______________"
exit 0



################################ qks/cpd/prev/coll/.... : #############################################
echo "___________ you may NOT have  seen this line!! PROBLEM if you see this !!! ____________"
exit 3

#####  ==========  misc-adms:
##__  timedatectl  set-time  "2024-12-30 10:07:00 CET"
##________________________________________  ___________________________


#####  ========== bups1...:
##----- w1-buups1-manually ...(OR use w1-sync script!):
##__  w1-bups1--tar-full: date;  cd ${vaarAuBups1DP}/ && cd /up1/mnt/T1fs/t1_RF/  &&  tar --one-file-system  -cpzvf "${vaarAuBups1DP}/bups1w/w1--$($cuds).tgz" "./w1_RF/"  >  "${vaarAuBups1DP}/bups1w/w1--$($cuds).tgz.log" ;  date ;
##__  w1-bups1--tar-increment : cdlla  ${vaarAuBups1_P}/bups1w/  &&  tar -cpzvf   w1--newer--$($cuds).tgz   $(find /up1/w1/  -newer  ./w1--2*.tgz  -type f) > w1--newer--$($cuds).tgz.log ; chmod 666 w1-* ;
##-----
##________________________________________  ___________________________





