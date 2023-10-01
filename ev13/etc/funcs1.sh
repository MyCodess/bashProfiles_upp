##__  #!/bin/bash
#################### non-oneLiner-/longer-funcs !  loggers, readins, getopts,.... ############################
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;
set  -u
set  -a

####################### logging-funcs #################################################################
##========== main-logging-func all levels ...:
q_logit1(){
	local usage11="q_logit1  <msg>  [logLevel==q_infoLevel  [logTag==tag_of_logLevel]]";
	msg1=${1:?"$usage11"}
	local  mylevel11=${2:-$q_infoLevel}
	local  mylogTag11=${3:-${q_logTagsA1[$mylevel11]}}
	(( $q_currVerboseLevel >= $mylevel11 )) && echo "${mylogTag11} $msg1"
	##__ OK1: (( $q_currVerboseLevel >= $mylevel11 )) && echo "${q_logTagsA1[$mylevel11]} $msg1"
}
##---sub-logging-funcs which all MUST call only the maon q_logit1() !! :
q_logFatalError()  { msg11="$1" ;  q_logit1  "$msg11"  $q_fatalErrorLevel ; }
q_logError()    { msg11="$1" ; q_logit1  "$msg11"  $q_errorLevel ; }
q_logWarn()     { msg11="$1" ; q_logit1  "$msg11"  $q_warnLevel ; }
q_logInfo()     { msg11="$1" ; q_logit1  "$msg11"  $q_infoLevel ; }
q_logDebug()    { msg11="$1" ; q_logit1  "$msg11"  $q_debugLevel ; }
#--more sub-log-funcs:
q_logStart()  {  msg11="$q_Tag1Start  $1" ; q_logit1  "$msg11"   $q_debugLevel ; }  ##--debug-start-line-output
q_logEnd()    {  msg11="$q_Tag1End  $1"   ; q_logit1  "$msg11"   $q_debugLevel ; }  ##--debug--END--line-output

############## __1END__ logging-funcs #################################################################


################### getoptsdef3 : #####################################################################
##-- read-in/process default-cmdline-options [-vlsi] ,if implemented, AND also additiona caller-defined-options !! otherwise not OK!!:
##-- try/test-it (try following eg to see its output):
	#-  opt11=m arg11=g   $0  -lsvmi -g aa
	#-  opt12=m arg13=g   $0  -lsvmi -g aa
	#-  opt12=m arg13=g   $0  -lsvkmi -g aa
	#-  opt11=k   opt12=m arg13=g   $0  -lsvkmi -g aa
##-- USAGE:
	#- if ONLY the evv--standard-options (now -lsvi ) are needed then just:   getoptsdef3 $@ ; shift $(($OPTIND - 1)) ;
	#- but if additional cmdline-options are needed then preset the caller-added-opts before calling the above line, as eg for [-fg -w <arg1>]: export opt11=f  opt12=g  opt11_val=0  opt12_val=0 arg11=w arg11_val="nothing" ...; #and then:
	#- /OR preset the  "optstr11" completely before invoking getoptsdef3  $@  ,as eg:  export optstr11="lgwt" ; getoptsdef3 $@ ; shift $(($OPTIND - 1)) ;
	#- then the values for the above added options are saved in:   opt11_val  opt12_val  arg11_val  ...
	#-!!-  the shift command MUST happen in the CALLER-script and not here inside the function!
	#-!!-  do NOT use additional getopts-call in your script, because a recursive call of getopts is too complicated und error-prone!! so if needed, thenuse your own getopts only!!
##--!!- here ONLY the FLAGS are set and NOTHING else happens! so eg creating/handling logfiles, doing simulation or making verbose are the 2do tasks of the CALLING-script and NOT this func!!
##--II- define your $USAGE11 in your script. it is included here in the error-msg!
getoptsdef3(){
	##--II- do NOT use declare here!! When used in a function, `declare' makes NAMEs local, as with the `local' command!! help declare
	optstr11_def="lsvihV"
	optstr11_def_user="${optstr11_def}${opt11}${opt12}${opt13}${arg11:+${arg11}:}${arg12:+${arg12}:}${arg13:+${arg13}:}"
	##--!!- following vars may NOT be local, must be GLOBAL, so that the caller script gets the returned values!! and also can set them directly!!
	optstr11=${optstr11:-"${optstr11_def_user}"}  ##--!!- don NOT make it local, so that this can be set directly in the caller-script, if prefered!!
	myFN11=${myFN11:-${0##*/}}
	tstamp11="${tstamp11:-$($cudts)}"
	logFN11="${logFN11:-/dev/null}"
	logit11=${logit11:-0}
	simulit11=${simulit11:-0}         ##--I-  0==NOT-set /NOT-simulation, real-executing
	verboseit11=${verboseit11:-0}     ##--I-  0==NOT-set /NOT-verbose
	verboseit22=${verboseit22:-0}     ##--I-  0==NOT-set /NOT-verbose  very-verbose
	interact11=${interact11:-0}   ##--I-  0==NOT-set /NOT-interactive
	getoptsdef3_usage11="Standard-Options, if implemented are [-${optstr11_def}] as:\n  -l Log-file-creation , -s Simulate-ONLY--dry-run , -v verbose , -V Very-Verbose-Debug, -i Interactive -h help-text-ONLY";
	usage_help_txt="\n===========================\n  $USAGE11 \n  $getoptsdef3_usage11 \n===========================\n";
	##============ cmdline-params-readin with getopts : =========================
	##__  echo "__${opt11},${opt11_val}_____$optstr11";
	while getopts "${optstr11}" optparam ; do
		##__ echo "$optparam  ====== $OPTARG ";
		case $optparam in
			##-?- e) simulit11=0   ;; ##-I- execute.it / NO.simulation, NO.test
			l  ) logFN11="${tstamp11}-${myFN11}.log" ; logit11=1 ;; ##--I- logit11 to a logfile
			s  ) simulit11=1 ;; ##__  echo "==========!! SIMULATION ! this is ONLY a dry run !!=========="  ;; ##-I- only.simulation , dry, NO.real.execution!
			v  ) verboseit11=1 ;;
			V  ) verboseit22=1 ; verboseit11=1 ;;
			i  ) interact11=1 ;;
			##__prev:  h  ) echo -e $usage_help_txt ; exit 3  ;;
			h  ) echo; echo "====================================================================";
				if  ( declare -F help11 >/dev/null ) ; then  help11 ; else echo -e $USAGE11 ; fi;
				echo; echo -e  $getoptsdef3_usage11 ;
				echo "====================================================================";echo;
				exit 0 ;;
				##__ if  ( declare -F help11 >/dev/null ) ; then  help11 ; echo -e $getoptsdef3_usage11 ; else echo -e $usage_help_txt ; fi; exit 3  ;;
			##--II-  individaul-additional-options-with-NO-arguments used by the caller-script ($opt11 MUST be preset in the caller-script before calling this func!):
			$opt11  ) opt11_val=1 ;;           ##-I- place-holder-1 for any individaul-additional-option-value, affected by cmdline-option "-$opt11", returned/accessible to the caller-script.
			$opt12  ) opt12_val=1 ;;
			$opt13  ) opt13_val=1 ;;
			##--II-  individaul-additional-options-WITH-arguments used by the caller-script ($arg11 MUST be preset in the caller-script before calling this func!):
			$arg11  ) arg11_val="$OPTARG";;   ##-I- place-holder-1 for any individaul-additional-option-argument, affected by cmdline-option "-$arg11 <xxx>", returned/accessible to the caller-script.
			$arg12  ) arg12_val="$OPTARG";;
			$arg13  ) arg13_val="$OPTARG";;
			##__prev:  z | $opt11  ) export opt11_val=1 ;;   ##__ echo opt11-set==$opt11 ;;
			##__prev: y | $arg13  ) arg13_val="$OPTARG";;   ##-I- place-holder-3 for any individaul-additional-params for the caller-script. argument-value saved in para11 accessible to the caller-script.
			\? ) echo -e "$q_errorTag  Wrong illegal Option $OPTARG !! see usage below:"; echo -e $usage_help_txt ; exit 3  ;;  ##__prev-:   "$USAGE11" ; echo "$getoptsdef3_usage11" ;echo ; exit 3  ;;
		esac
	done
	##=====-END-== cmdline-params-readin with getopts : =========================
	(( $verboseit22 > 0 )) && echo -e "  ____ getoptsdef3-final-options are set as:\n  logFN11: $logFN11 , logit11: $logit11 , simulit11: $simulit11 , verboseit11: $verboseit11 , verboseit22: $verboseit22 , interact11:  $interact11 , opt11: $opt11 , opt12: $opt12 , opt13: $opt13 , arg11: $arg11 , arg12: $arg12 , arg13: $arg13  ____"
}
##--!!-  makes NO use here:  "shift $(($OPTIND - 1))" ; It MUST happen in the CALLER-script! here it works ONLY on this function params and NOT on caller-script params!!
##--I- echo "now process the normal cmdline-arguments of the script ..."
##===== 1__END__ getoptsdef3 -------------------------------------

#################### __1END__ basic-funcs: readin,... #########################################


################### bups-lags-funcs-evv : #############################################################
##----- ONLY touches/creates/updates the synced-/backuped-timestamp-file ${src1}/${syncFlagFN} and then copies it to the target-backup withOUT any verfifyings,... !
##-- updates in src-backup the ${src1}/${syncFlagFN} with  ll ${src1}  and copies it to the backedup-Dest ! just as a timestamp of latest update!
##-- the sync-flag-file is ONLY a timestamp!! this function does NOTHING else! so no checking of backups/rsync/...! only a flag-timestamp to remember ...!
syncFlagUpdate(){
	USAGE11="USAGE: syncFlagUpdate  <_RF-Dir/source-bup>  <_BP-Dir/_CP-Dir/target-bup>"
	USAGE11_eg="--eg--test-it-with-dummy:  syncFlagUpdate  /up1/varu/varau/tests/  /up1/varu/varau/tests/d1/"
	src1="$1"
	target1=${2:?"$USAGE11 ; $USAGE11_eg"} ;
	syncFlagFP="${src1}/${syncFlagFN}"
	backupInfosSrc=" _RF/source--backedup_from:   $(hostname) :  $src1     on: $(cd "$src1" || return 3;  pwd -P)"    ##--II-could also use:  readlink  -mve /up1/w_CP_rw  #/OR  realpath -Pe /up1/w_CP_rw/
	backupInfosDest=" _BP/_CP/dest--backedup_to:   $(hostname) :  $target1  on: $(cd $target1 || return 3; pwd -P ; pwd -P; ls -l)"   ##--II-could also use:  readlink or realpath ! see above.
	cd "$src1" || return 3;  [[ -a $syncFlagFP ]] &&  chmod a+w $syncFlagFP ;
	(el1d ; echo "$(hostname; date)"; echo "${backupInfosSrc}" ; echo "${backupInfosDest}" ; el1de ; ) >> $syncFlagFP ; ##-I- do not replace ; with && due to fat/NTFS-parts, where chmod is not possible due to mount-params!
	chmod 444 $syncFlagFP;
	'cp' -fv "$syncFlagFP"  "${target1}/";
	echo "===== Sync-File updated, see in backup-src: $syncFlagFP ====="
}
##-----------------------

##--- bupsFlag-files-update in w1-l1nw :
##- flag-files are on t1, so not working:  chmod 444 ${l1nwBupsLogsFlagsDP}/$2 ; }
bupsFlagUpdate(){
	USAGE11="USAGE:  bupsFlagUpdate  <DIR-containing-backuped-file>  <BupFlagFileName-to-be-updated-in: ${l1nwBupsLogsFlagsDP}/ >  [msg-nts-addies [msg-end]]"
	USAGE11_eg="--eg--dummy-test-it with  :  bupsFlagUpdate   /up1/varu/varau/tests   t1.flg   msg1-start   msg1-end"  ##--if t1.flg not-exit, it will be created !
	target1=$1 ; flagFileName1=${2:?"$USAGE11 ; $USAGE11_eg"} ;
	cd "$target1" || return 3; 
	( el1d "$3" ; date ; hostname; pwd -P ; pwd -L ; ls -l  "$target1"/ ; echo  "--------------"; echo  "--- SubDIRs of $PWD :" ; tree -L 2 ; el1de "$3 -- $4"; )   >> ${l1nwBupsLogsFlagsDP}/${flagFileName1} ;
	cd - ;
}
##-----------------------
###### __1END__ ### bups-lags-funcs-evv : #############################################################

q_ple1  "${BASH_SOURCE[0]##*/}"

