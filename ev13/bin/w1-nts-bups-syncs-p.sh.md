__________________  w1s.sh.txt : _____________________________________________
exit 3


#####  ==========  cu1-...:

    _______:  samba/cifs rsync (Lv13 (t1_RF-usb) <--> HP13 (t1_CP , evtl. some updates) ...):
    - !-nts: somehow "cp -a ..." does not work !?!? (or take long/ever!?) ! use instead "rsync -a ..."  !!
    1- mount -t cifs  //192.168.43.15/t1_RF_Lv13   /mnt/t1  -o  username=u1,iocharset=utf8,uid=u1,gid=gu1
    2- first from-MEs-PC:  sync fully w1_RF/dc1K (dc1k RF is on MEs-PC! so full-sync! not only updates!):
        rsync  -n  -v  -rtlHO  --modify-window=5  --delete  /up1/t1/w1_RF/dc1K/  /mnt/t1/w1_RF/dc1K/
        - old---only-update-sync!:  rsync  -n  -v  -rtlHO  --modify-window=5  -u   /up1/t1/w1_RF/dc1K/  /mnt/t1/w1_RF/dc1K/   ##--!! NO --delete + -u !  #--/OR:  rsync  -n  -avO  --no-perms -u ...
    3- _RF to _CP sync:  
        dry11=' '   syc_from=/mnt/t1/w1_RF/   syc_to=/up1/t1/w1_RF/    w1-sync.sh   ##---bzw.:
        /OR:  rsync    -n  -v -rtlHO --modify-window=5  --delete      /mnt/t1/w1_RF/  /up1/t1/w1_RF/   ##--/OR: rsync    -n  -avO   --modify-window=5  --delete ...

	_______:  tar-incremental/-accumulative--w1_RF + updates:
    - incr-w1-bups1: - 2chk! :
    date;  days11=10  srcDP11="${w1DPPhys}/"  destDP11="${vaarAuBups1DP}/bups1w1/"  destFP11=${destDP11}/w1_newer--$($cuds)-${days11}_days.tgz ;  cdlla "${destDP11}" &&  tar -cpzvf   ${destFP11}   $(find  "${srcDP11}"  -mtime -${days11}  -type f) >  ${destFP11}.log  ; date ;
    - full-w1-bups1:  
    --- prev-bups1w1-OK: --------------
    - incr-w1-bups1: - 2chk!! new!!:   date; export  days11=30  srcDP11="${w1DPPhys}/"  targDP11="${vaarAuBups1DP}/bups1w1/" ;  cdlla "${targDP11}" &&  tar -cpzvf   w1_inc--$($cuds)-${days11}_days.tgz   $(find  "${srcDP11}"  -mtime -${days11}  -type f) > w1_inc--$($cuds).tgz.log  ;
	- full-main-w1_bups1:
        - date;  export srcDP11="${w1DPPhys}/"  targDP11="${vaarAuBups1DP}/bups1w1/" ;  cd "${targDP11}" && tar --one-file-system  -cpzvf  "${targDP11}/w1--$($cuds).tgz"  "${srcDP11}"  >  "${targDP11}/w1--$($cuds).tgz.log" ; date ;
        - prev1-ok:  date;  cd ${vaarAuBups1DP}/ && cd /up1/mnt/T1fs/t1_RF/  &&  tar --one-file-system  -cpzvf "${vaarAuBups1DP}/bups1w1/w1--$($cuds).tgz" "./w1_RF/"  >  "${vaarAuBups1DP}/bups1w1/w1--$($cuds).tgz.log" ;  date ;
	- incrementel/addies/newer:
        - 2chk!! new!!:   date;  export srcDP11="${w1DPPhys}/"  targDP11="${vaarAuBups1DP}/bups1w1/" ;  cdlla "${targDP11}" &&  tar -cpzvf   w1--newer--$($cuds).tgz   $(find  "${srcDP11}"  -newer  ./w1--2*.tgz  -type f) > w1--newer--$($cuds).tgz.log ; chmod 666 w1-* ;
        - prev-ok: cdlla  ${vaarAuBups1_P}/bups1w1/  &&  tar -cpzvf   w1--newer--$($cuds).tgz   $(find /up1/w1/  -newer  ./w1--2*.tgz  -type f) > w1--newer--$($cuds).tgz.log ; chmod 666 w1-* ;

    _______:  t1 syncs..:
    - OK worked, excluding mms1-files (online-rsync, so mms1-file was open):  rsync    -n  -v -rtlHO --modify-window=5  --delete    --exclude=mms1_P1  /up1/t1/   /mnt/t1/t1_RF/
##________________________________________  ___________________________


######################### pre_Y2020 : ###########################################################
#####  ==========  manual-copys/bup, simple-quick-full (no-sync):
	- as-rt: (OR do it with  cpafat ... )
	date;  tar  --one-file-system  -cpzf  tar   ${bups1TrDP}/w1_RF-$($cuds)  /up1/w/  ; date  ##--on-tx-media
	date; cp -a   /up1/mnt/T1fs_loc/w_RF/   /up1/media/med1_RF/w_RF-$($cuds)   ; date ;
	bupsFlagUpdate  /up1/media/med1_RF/  "w_bups.flg"
	syncFlagUpdate   ${syc_from}/   ${syc_to}/
##________________________________________  ___________________________


#####  ==========  MsWin-Sync for w_RF :
	dir  C:\up1\w  T:\t1_loc\w_CP
	dry-run:	robocopy C:\up1\w  T:\t1_loc\w_CP   /mir /r:3 /w:3 /dst  /ndl /L    ##--> dst : ignore one hour difference (vo17 / commer-winter) ; if needed also add /fft for fat systems! ; /L : dry-run only listing!
	copying:	robocopy C:\up1\w  T:\t1_loc\w_CP   /mir /r:3 /w:3 /dst  /ndl       ##--> dst : ignore one hour difference (vo17 / commer-winter) ; if needed also add /fft for fat systems!
##________________________________________  ___________________________


#####  ==========  w_CP-READONLY-remount/rebind into another DIR:
	cdup1
	##--rt (OR assign rights in fstab to users !?):
	#-!!- options can NOT be combined with --bind !! so must be two seperate cmdlines, with rebound!! see man mount !!
	mount --bind   /up1/mnt/T1fs_loc/w_vo17_CP   /up1/media/med1_CP
	mount  -o remount,ro,bind  /mnt/T1fs_loc/w_vo17_CP  /up1/media/med1_CP
	##--u1:
	ln -s  /up1/media/med1_CP   w_CP_readOnly
	cdup1; rm ./w ; ln -s w_CP_readOnly  w ;    ##-- (old: cdup1 && rm ./w  ./w_CP &&  ln -s /up1/media/med1_CP  ./w_CP &&   ln -s  ./w_CP  ./w)

	_______:  tesing of remount/rebind with a dummy -DIR eg test-dir /OK:
	mount --bind   /up1/varu/varau/tests/d2  /up1/media/t1
	vo17:~ # mount  -o remount,ro,bind  /up1/varu/varau/tests/d2  /up1/media/t1
##________________________________________  ___________________________


#####  ==========  w-rsyncs:
	-! ok-fat-as-rt:  rsync -n -v -rtlHO --modify-window=5 --delete  /up1/w_RF/    /up1/media/MED1_RF/bups3/w/   ##--170506
	-!! "-a"-problem:  usu. the problem is with "-p" (du to mounting or so ...). then. -a is really just "-rlptgoD"
	-! Sommertime/Wintertime problem by unix/UTC-stamp <--> fat/localtime-stamp backups !?: due to one hour(3600 sec) unterschied in fat32 and Unix !?:   --modify-window=3601 : Allerdings werden möglicherweise Änderungen nicht gesichert, die weniger als eine Stunde zurückliegen!!
	--->!! all:
		export syc_from="/up1/w_RF"   &&  ll  ${syc_from}/  &&  export syc_to="/up1/w_CP_rw"  && ll  ${syc_to}/
		?:  rm ${syc_to}/*flg*
	--- vo17-hom  w_CP , w_RF sync (w_RF was usb-fat):
		-!! if problem again with "time / +1 hour", then: rsync --size-only -nv   ..... , otherwise:
		1- check status :  rsync -nv    -rtlHO --modify-window=5  --delete  ${syc_from}/  ${syc_to}/
		2- with -u :       rsync -nv -u -rtlHO --modify-window=5  --delete  ${syc_from}/  ${syc_to}/
		1.b- check again:  rsync -nv    -rtlHO --modify-window=5  --delete  ${syc_from}/BKs1_RF  ${syc_to}/
	--- usb.fat--ext3.HD sync:
		-uue-sync-fat.usb-to-ext.HD:  rsync -nv  -rtlHO --modify-window=5  --delete  /media/MED1/w_RF_miniUb32/docs_m/dres/devnts  /local/.up1/w/docs_m/dres/
		-uue-sync-ext.HD-to-fat.usb:  rsync -nv  -rtlHO --modify-window=5  --delete  /local/.up1/w/docs_m/dres   /media/MED1/w_RF_miniUb32/docs_m/
		-! see also nts below, in other sections, and also in uue-bin-scripts !
		- use also  --modify-window=1,  or even larger than 1, if from fat/MsWIn to Ext3 filesystems...!! :   OK-fat-2o-ext.HD:
	--- usb.fat--ext3.HD OK syncs:
		rsync -n  -av --modify-window=5  --delete /up1/media/fat1/w_usb32/BKs1_RF/BKs1_ITs/  /up1/w/BKs1_RF/BKs1_ITs__CP.ofc1/
		rsync -n  -av --modify-window=5  --delete /up1/media/fat1/w_usb32/docs/  /up1/w/docs__CP.ofc1/
	--- chmod for READONLY w_CP, if do not want remount/rebinding :
		eg w:  find w_vo17  -type d -exec chmod 555 {} \;  find w_vo17  -type f -exec chmod 444 {} \; ##--!!- BUT does not work if mount-persissions set! eg if w_CP on a ntfs/fat-mounted part!!
	--- flag-files-updates:
		syncFlagUpdate   ${syc_from}/   ${syc_to}/
		bupsFlagUpdate  "${syc_to}/"  "w_bups.flg"
	--- rm   ${syc_to}/00_miniUb32_w.flg.txt
##________________________________________  ___________________________

