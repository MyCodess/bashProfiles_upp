export myname11="${BASH_SOURCE[0]##*/}" ;
q_pls1  "${myname11}" ;
##-- 2310-ofc1  devpc1 /devvdi1 / dev_vdi_1

#####  ==========  basic tags/syystg/...:
##-- OS-/syys-Tags for syys-dirs/L1NW-PCs,...  ##--I- diff: syys <--> OS
export  q_osTg=msw             #- OS-short-abbrev-name : used for q_syysTg...
export  q_osRelTg=""           #- OS-longname: in case of archlinux, due to rolling-system, just your OS-tg, otherwise: distro.ver.arch--at-first-install-time!! not the current-updated/upgraded-one !! ArXis rolling, so NO-release-No, here jsut Kernel-No during install!
export  q_diskTg=dev1vdi       #- OS-short-abbrev-name : used for q_syysTg...; does NOT have to be realy Disk-Part! is just yout TAG !
export  q_syysNoTg=2310        #- MY-assigned-No, just randomly for identifying my system; never changes! usu. the date of very FIRST install YYMM !
export  q_syysCatTg=RF         #- just flag, not used yet. choice: RF, CP, TE (testie), DM (dummy)
export  q_syysTg=${q_syysNoTg}${q_osTg}       #--UNIQUE-ID of a syys !! usu. YYMM<osTg> , as 2209arx
##-echo "   _______  q_syysTg: $q_syysTg"
##--II-so: for ofc1-pr:  syys == 2310msw , on host == devvdi1 !!
###________________________________________  ___________________________


#####  ==========  host1-specific-addies:
##----- HOME + USER + ... basics-OS (pre calling any profs! the rest in ms-prof !):
export  USER=${USERNAME:-"userXX"}
export  HOMEW=${USERPROFILE}     ##--OK1-in-msw-format:  export HOME="${HOMEDRIVE}/${HOMEPATH}"
export  HOMEW_cyg="$(cygpath $USERPROFILE )"
export  HOME="${HOMEW_cyg}"
alias sethome1='export   HOME=${USERPROFILE}'
##__ if-liked-set-also-prjid-here:   export  prjID_active1=ofc1
###________________________________________  ___________________________


##__ q_ple1  "${myname11}---${q_syysNoTg}${q_osTg}_${q_Hostname}_${q_diskTg}---${q_osRelTg}"
q_ple1  "${myname11}" ;

