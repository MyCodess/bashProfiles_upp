export myname11="${BASH_SOURCE[0]##*/}" ;
q_pls1  "${myname11}" ;

##-- OS-/syys-Tags for syys-dirs/L1NW-PCs,...  ##--I- diff: syys <--> OS
export  q_osTg=arx                   #- OS-short-abbrev-name : used for q_syysTg...
export  q_osRelTg="$q_osTg"            #- OS-longname: in case of archlinux, due to rolling-system, just your OS-tg, otherwise: distro.ver.arch--at-first-install-time!! not the current-updated/upgraded-one !! ArXis rolling, so NO-release-No, here jsut Kernel-No during install!
export  q_diskTg=ub128p3             #- OS-short-abbrev-name : used for q_syysTg...; does NOT have to be realy Disk-Part! is just yout TAG !
export  q_syysNoTg=2209               #- MY-assigned-No, just randomly for identifying my system; never changes! usu. the date of very FIRST install YYMM !
export  q_syysCatTg=RF                #- just flag, not used yet. choice: RF, CP, TE (testie), DM (dummy)
export  q_syysTg=${q_syysNoTg}${q_osTg}    #--UNIQUE-ID of a syys !! usu. YYMM<osTg> , as 2209arx
##-echo "   _______  q_syysTg: $q_syysTg"

##__ q_ple1  "${myname11}---${q_syysNoTg}${q_osTg}_${q_Hostname}_${q_diskTg}---${q_osRelTg}"
q_ple1  "${myname11}" ;



#################### no-arx bzw. prev: ######################################################################
##--I- pre-arx the syys-modified-files were backuped etra! but now 1) the whole /etc can be backed up regularly and 2) in arx thies is done genericly in /up1/ev11/bin/syystgStat.sh  during bup, if needed !
##============ syys-modified-files transferd to  /up1/ev11/bin/syystgStat.sh by arx ! if needed again here !? : ------------------------
##--  do NOT set syysMod_files for arx ! it will be set generically/dynamically in syystgStat.sh bup-script !
##--  for other systems could set it to ... : export  syysMod_files="/etc/bash.bashrc /etc/fstab /etc/group /etc/hosts /etc/passwd /etc/resolv.conf /etc/locale.gen /etc/default/grub /etc/pacman.conf /etc/pacman.d/mirrorlist" ;
##__  real-correct-line--but for now is faster the below static one!:  export  syysMod_files="$(pacman -Qii | grep  "^MODIFIED"  |  sed  -e 's:MODIFIED\s*::' |  tr '\n' ' ')" ; 
##--  /OR:           $(echo $(pacman -Qii | grep  "^MODIFIED"  |  sed  -e 's:MODIFIED\s*::' )) ; sed can NOT easily delete newLine !!  ##--/OR  "$(pacman -Qii | awk '/^MODIFIED/ {print $2}' )";
##__  export  syysMod_files_more="";    ##__if-needed add something here ...!
##__  export  syysAdded_files="/etc/wpa_supplicant/  /etc/vconsole.conf  /etc/locale.conf";    ##--II- added by evv! the generic line in syystgStat.sh will ONLY get the modified files , which belong to certain pkg !!
##----------------------------------

