##__  #!/bin/bash
export myname11="${BASH_SOURCE[0]##*/}" ;
q_pls1  "${myname11}" ;

  set +o history
set -a
set -u
##----- mesp_RF:
declare -xi mespRFNo=1
mespRTDP=${q_UppDP}/mesfs      ##--II-RooTDP of ALL mes-mountPoints AND mes-fsc-links,...
mespRFDP=${mespRTDP}/mesp${mespRFNo}
mespRFFN=mespfsc${mespRFNo}
mespRFFP=${mespRTDP}/${mespRFFN}
mespRFLoopFP=/dev/loop${mespRFNo}  #--obsl-but-ok-here.
mespRFMapperFP=/dev/mapper/${mespRFFN}
##--??needed??-   mespRFPhysFN=${mespRFFN}_RF
##--??needed??- done with realpath in funcs! :  mespRFPhysFP="${uufs1PhysDP}/${mespRFPhysFN}"

##----- mesp_AR:
declare -xi mespARNo=3
mespARDP=${mespRTDP}/mesp${mespARNo}
mespARFN=mespfsc${mespARNo}
mespARFP=${mespRTDP}/${mespARFN}
mespARLoopFP=/dev/loop${mespARNo}
mespARMapperFP=/dev/mapper/${mespARFN}
##--??needed??-   mespARPhysFN=${mespARFN}_AR
##--??needed??- done with realpath in funcs! :  mespARPhysFP="${uufs1PhysDP}/${mespARPhysFN}"   ##--II- is yet partly not physicar (/mnt/VARUfs/...) but ok for backups,...!

#----- MEs-roots/basics-Pathes...:
mesDP="${mespRFDP}/MEs"
wpmDP="${mesDP}/WPad_m"
abmsDP="${wpmDP}/abms_m/"
##-- absDP=${wpmDP}/abs
##-- abFP=${absDP}/ab1_1kk_peops1.txt

#----- MEs-apps/utils/bups/...:

#----- MEs-DU:
wpDP_du="${wpDP}/du-wp"
wpmDP_du="${wpmDP}/du-wp-m"
absDP_du="${wpmDP_du}/abs-du-m"
abFP_du="${absDP_du}/0ab-du.txt"

#----- Allg-finals: -------------------------

############ ENVs-part mes :  ###############################################
##============ aliases-mes: ===============================
##--prev:  alias cpabs2wp='echoline1 ; cp  -v -f  ${absDP}/*ab!(*_m*)   ${absCP_DP}/  &&  date >> ${absCP_DP}/${syncFlagFN} ; ls -al  ${absCP_DP}/ ; echoline1end'
##-- alias cpabs2wp='echoline1 ; cp  -v -f  ${absDP}/ab*.txt   ${absCP_DP}/  &&  date >> ${absCP_DP}/${syncFlagFN} ; ls -al  ${absCP_DP}/ ; echoline1end'
alias cdabms='cdlla  $abmsDP'
##-- alias cdabs='cdlla  $absDP'
alias cdmes='cdlla  $mesDP'
alias cdmesbup1='cdlla  ${mesBup1DP}'
alias cdwpadm='cdlla  ${wpmDP}'
alias tb1='thunderbird  --no-remote  --safe-mode  --new-instance  > /dev/null  2>&1  &'  ##--if-required:  LC_TIME=en_DK.UTF-8  
##-- alias viab='vi1  $abFP'
##-- alias vilabs='vi1  -o  $wpmDP/1labs*.txt  $wpDP/1labs*.txt'
alias vitagh='vi1  -o  $wpDP/tagh*.txt  $wpmDP/tagh*.txt'
##-- alias viewab='view $abFP'
##--- te1-m1:
alias  te1wpm="xfce4-terminal   --working-directory=${wpmDP}  --tab --working-directory=${wpmDP}  --tab --working-directory=${wpmDP}  --tab --working-directory=${tosoDP}  --tab --working-directory=${tosoDP} &"

##--- DU_aliases:
alias cdabs_du='cdlla  $absDP_du'
alias cdwpad_du='cdlla  ${wpDP_du}'
alias cdwpadm_du='cdlla  ${wpmDP_du}'
alias viab_du='vi1  $abFP_du'
##__  alias ttabs1_du="sudo -u $USER  gnome-terminal  -t DUs    --tab --working-directory=${wpDP_du}  --profile=${q_TN_mb}   --tab --working-directory=${wpmDP_du}   --tab  --working-directory=${absDP_du}  --tab --working-directory=${absDP_du}/abs-du-2010  --tab --working-directory=/${q_UppDP}/w1_AR/DU_cu  --tab --working-directory=${wpDP} --profile=${q_TN_mb}"
##--II-(!! "--profile=xxx" works ONLY per terminal-TAB !! so if want all tabs in profileXX then enter this per TAB parameter !!):

##=========== funcs-mes: ==================================
##--  absg() { grep -iR "$1" "${absDP}/*"; }

############################## bups1-All : ############################################################
##=========== bups1-All_RF (also used by rt !! ) : =====================================================================
bups1ev1()  { echo "===== bups1--${q_EvvDP}/ : ====="; date;  cd  ${vaarAuBups1DP}/  &&  tar --one-file-system  -cpzf  "${vaarAuBups1DP}/ev1_${q_syysTg}_tz--$($cudts)"  "${q_EvvDP}/" ; date; }
bups1up1()  { echo "===== bups1--${q_UppDP}/ : ====="; date;  cd  ${vaarAuBups1DP}/  &&  tar --one-file-system --exclude="${q_UppDP}/mnt/*/*"  -cpzf  "${vaarAuBups1DP}/up1_${q_syysTg}_tz--$($cudts)"  "${q_UppDP}/" ; date; }
bups1configsUsers()  {   ##--is now called by bups1syys !
	date; local bupTargetFP11="${syysTgBupsDP}/userss-configSubs-home--$($cudts).tgz"  ;
	tar --one-file-system  --exclude-caches  --exclude-tag="${q_NoBupFlagFN}"  --show-omitted-dirs  -czpf ${bupTargetFP11} \
	~u1/.config/xfce4/  ~u1/.config/gtk-3.0/    \
	~m1/.config/xfce4/  ~m1/.config/gtk-3.0/ ;  \
	echo "==== see generated file: $bupTargetFP11" ; date;
}
bups1syysModFiles() {
	##-- manully modified system files by evEnv:
	#--II- ALWAYS system-mod-files must do with viorg!! with the same syntax!! and pro mod-file ONLY ONE _NNNNNN_org file!! the files in 00org-DIRS need NOT have _org suffix !!
	#-- do sometimes dynamically with (maybe -print0 ?: syysMod_files="$( find /etc /usr  -iname "*_org"  | sed s/_[0-9]*_org// | sort )"
	local  cudts11="$($cudts)";
	echo; echo "---------- tar of system-mod-files in : -------------------------" ;
	## --older-output-format:  export  syysMod_files_arx1="$(pacman -Qii | grep  "^MODIFIED"  |  sed  -e 's:MODIFIED\s*::' |  tr '\n' ' ')" ;
	export  syysMod_files_arx1="$(pacman -Qii | grep -F "[modified]" | sed -e 's@.*: *@@;s@ \[modified\]@@;s@  *@ @' | tr '\n' ' ')" ;
	export  syysMod_files="${syysMod_files_arx1}"
	export  syysAdded_files="$( find  /etc  -iname  *${q_Label1qq}* )"
	export  syysAdded_files="${syysAdded_files}  /etc/vconsole.conf  /etc/locale.conf"    ##--  /etc/wpa_supplicant/  are all already 1q_xxx ! otherwise add it also !
	export  syysMod_files_more="";    ##__if-needed add something here ...!
	export  syysMod_tar_FP="${syysTgStatsConfigsDP}/${cudts11}_systemModifieds_${q_syysTg}.tgz" ;
	tar -cpzf  ${syysMod_tar_FP}   ${syysMod_files}  ${syysAdded_files}   ${syysMod_files_more}  ;
	ls -lh     ${syysMod_tar_FP} ;
}
##-- both above bups1 here called by bups1syys :
bups1syys() { echo "===== bups1--${syysDP} : ====="; bups1configsUsers ; bups1syysModFiles ; "${q_BinDP}/syysTgStat.sh"  >> $syysTgStatsLogFP  2>&1 ; rsync  -v  -rtlHOx --modify-window=5  --delete    ${syysDP}  ${vaarAuBups1DP}/  ; }
bups1mesp() { src11_FP="$(realpath  ${mespRFFP})";   to11_FP="${vaarAuBups1DP}/${src11_FP##*/}--$($cudts)" ; echo "===== bups1--${src11_FP} : ====="; date;  cd  ${vaarAuBups1DP}/  &&  cp -v -p -L  "${src11_FP}"  "${to11_FP}" ; date; }
bups3mespAR() { src11_FP="$(realpath  ${mespARFP})"; to11_FP="${vaarAuBups1DP}/${src11_FP##*/}--$($cudts)" ; echo "===== bups3--${src11_FP} : ====="; date;  cd  ${vaarAuBups1DP}/  &&  cp -v -p -L  "${src11_FP}"  "${to11_FP}" ; date; }
##--bups3-All:
bups3etc()  { echo "===== bups3--/etc : ====="; date;  cd  ${vaarAuBups1DP}/  &&  tar --one-file-system  -cpzf  "${vaarAuBups1DP}/etc_${q_syysTg}--$($cudts)"   /etc  ; date; }
##--bups5-All / basicall could be replaced by whole-OS-cloning/bup bzw. usb_OS-cloning or so ,...!?::
bups5home() {
	##--II-The-Sequence of the  tar-PATHES-params VERY relevant!! due to q_NoBupFlagFN !! /home  MUST be the LAST !! because in the parent-dirs of bookmarks-dir there are q_NoBupFlagFN tag-files!! so when FIRST /home, then later pathes-params will NOT be taken into tar-file!!
	echo "===== bups5--/home : ====="; date;
	export tarFP="${vaarAuBups1DP}/home_${q_syysTg}--$($cudts).tgz" ;      ##--prev-form--if-multi-syys-on-same-HD/host:    export tarFP="${vaarAuBups1DP}/home--$($cudts)-${q_syysTgL2}.tgz" ;
	tar --one-file-system   --exclude-caches  --exclude-tag="${q_NoBupFlagFN}"  -cpzvf  "${tarFP}"   ~u1/.config/vivaldi/Default/Bookmarks    ~m1/.config/vivaldi/Default/Bookmarks  ~u1/.config/chromium/Default/Bookmarks	 ~m1/.config/chromium/Default/Bookmarks   /home  2>&1 1>  "${tarFP}"-tared-out.log  |tee "${tarFP}"-tared-err.log ;  date;   ##--??:  --show-omitted-dirs
	[[ ! -d  "${vaarAuBups1DP}/../bupsvar_tr/"  ]] &&  mkdir  "${vaarAuBups1DP}/../bupsvar_tr/"
	mv -i "${tarFP}"-*.log  "${vaarAuBups1DP}/../bupsvar_tr/"
}
##=========== __1END__bups1-All_RF =============================================================================================

##=========== XWins ----
##__  NOT-ok-if selber starting X! only for openning XWIndows by u1/... :  ${DISPLAY=":0.0"}  ##--I?-just a default/dummy! not always correct !! set manually if needed ...!

##-- end: ----------------------------------------------------------
q_ple1  "${myname11}" ;

