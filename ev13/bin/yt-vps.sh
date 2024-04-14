#!/bin/bash

#############===============New1: ########################################
##--II- for more params/details see:  youtube-dl --help  + its README bzw. docs !
##---- Hist:
#	- /_230129  :  seperating YT-archive-log-files of MPs and VPs  as: hist1_YT_MPs.log and hist1_YT_VPs.log
#	- 170318:  filname without "uploader_id" , so only "uploader"; so modifying locFN1 and deleting %(uploader_id)s_x_ from it !
#	- 151223:  minro-logging-cosmetic adaptions, new argument -n forupdates/newer-than YYYYMMDD ;
#	- 140310:  locFN1 : adding %(uploader_id)s for having the user-URL; AND removing -get-url from simulate/-s
#	- 140200-initial: locFN1="${locFN1Prefix}%(title)s_x_%(uploader)s_x_%(id)s_x_%(upload_date)s${locFN1Suffix}.%(ext)s"
##========================================================================
myFN1=${0##*/}
myInvok1=" $0 $*"; ##--i-how I was called from the user.

##--old1-  USAGE1="===USAGE: $myFN1  [ -hlsvpun:w:a ] <URL> with: -h: help-text-and-exit , -l : No-Logfile, -s : simulation, -v : verbose , -p : Playlist-whole-dw , -u : User-whole-dw--Redundant-for-now , -n <newr-than-date-YYYYMMDD> ,  -w <search-word-in-title-of-each-clip> ,  -a <links-file-name> : read-links-from-a-file-to-dw"
show_help11(){
	cat <<TXT11

	=============================== USAGE : ======================================
	$myFN1  [ -hlsvpun:w:a ] <URL>   with:
	-h	: help-text-and-exit , do-nothing,
	-l	: No-Logfile-Creation,
	-s	: Simulation-Only, NO-dw,
	-F	: Show/list all downloadable file-sizes+formats AND do ONLY-Simulation, so included -s/--simulation,
	-v	: Verbose,
	-p	: Playlist-mode : PL-index-enumeration-in-filenames +  whole-PL-dw,
	-u	: User-whole-dw--Redundant-for-now, Just-give-User-URL,
	-n  <YYYYMMDD>  	: update, Newer-than-date-dw <YYYYMMDD>,
	-w  <search-word>	: Only-clips-including <search-word> in-title,
	-m  <more-arbitrary-optionS--must_be_shell_escaped---are-added_literarly, can also be several options alltogether escaped>
		see man yt-dl for full-options,   eg:
		-m  ' -S "res:480" '  ## best video, bot not higher resolution than 480p of the smaller Dimension/Side !
		-m  ' -f "b"  -S  "filesize~50M" '  ##: Download best video (that also has audio) that is closest/etwa  50 MB
		---oldstyle-eg with -f :
		-m ' -f bestvideo[filesize<10M]+bestaudio/best[height<=480] ' , 
		-m -f "b" -S "filesize:50M"   #new-style of -f "b[filesize<50M] / w" : best-video+audio < 50MB, or then smalles one!
	-a  <links-file-name>	: read-links-from-a-file-to-dw"
	==============================================================================

TXT11
}

tstamp="$($cudts)"  ##--II- NOT datetime, due to find-call!
logfile1="$($cudts)_dw.log"
locFN1="";  ##--local-file-name for the clip to be saved!
locFN1Prefix="";  ##--local-file-name-PREFIX: will be added to the BEGINNING of the COMMON-part of localfilename!
locFN1Suffix="";  ##--local-file-name-Suffix: will be added to the END of the COMMON-part of localfilename BEFORE fimename-type-end-suffix (also eg before .mp4/.flv/...!
descpDir1="./0-descps1";
yt_DW_archHistLog_FP="${mpswpDP}/hist1_YT_VPs.log"    ##--I-archive-history-central-logfile to avoid re-downloading, to remember downloaded-hist !
##
while getopts "hlsFvpun:w:m:a" optparam
do
	case $optparam in
		l ) l11=0; logfile1=/dev/null;;
		s ) F11="--simulate  --get-filename" ; l11=0 ;  logfile1=/dev/null ; yt_DW_archHistLog_FP=/dev/null ; echo "=========== SIMULATION-Mode-Only, NO-DWs : ===============" ;;  ##--I-so do NOT write it to the YT-histi/arch-file! NAD Only-Simulate!
		F ) F11="--simulate  --get-filename  --list-formats" ; l11=0 ;  logfile1=/dev/null ; yt_DW_archHistLog_FP=/dev/null ; echo "=========== SIMULATION-Mode-Only, NO-DWs : ===============" ;;  ##--I-so do NOT write it to the YT-histi/arch-file! NAD Only-Simulate!
		v ) v11="-v";;
		p ) p11=1 ; locFN1Prefix="%(playlist_index)s_x_${locFN1Prefix}"; locFN1Suffix="${locFN1Suffix}_x_%(playlist)s";;   ##--III- add Index-No to the beginning of the clipname of the PlayList and PLayListname to its END!
		u ) u11=1;; ##--III- redundant: for now it is doing nothing! the URL must be just username without any clip-/watch-param!
		n ) n11="--dateafter $OPTARG";;   ##--I- newer-than YYYYMMDD (incl. this date-day!)
		w ) w11="--match-title  $OPTARG";;  ##--II- giving a search word, and download ONLY clips whose tilte contain the PARAM to -w  !
		m ) m11="$OPTARG";;  ##--II-more-beliebig-cmdline-options, must escaped!. see manpage for youtube-dl for more possible options. here they MUST be escaped by Hochkommata ! eg:  -m ' -f bestvideo[height<=300]+bestaudio/best[height<=480] '
		a ) a11="-a " ;; ##--II- read URLs from a local-text-file! the real URL of the linksfile must be now added to -a !
		h ) show_help11;   exit 0 ;;
		\? )echo; echo "==##== Error: wrong parameters:";  show_help11;   exit 3 ;;
	esac
done

shift $(($OPTIND - 1)) ;
URL1="${1:?See Usage with -h}"  ##--/OR, but is showed without newlines:   URL1="${1:?$(show_help11)}"
##--prev1-bis-170317:  locFN1="${locFN1Prefix}%(title)s_x_%(uploader)s_x_%(uploader_id)s_x_%(id)s_x_%(upload_date)s${locFN1Suffix}.%(ext)s";
locFN1="${locFN1Prefix}%(title)s_x_%(uploader)s_x_%(id)s_x_%(upload_date)s${locFN1Suffix}.%(ext)s";
##--211225-changed:  cmd1="youtube-dl ..."
cmd1="yt-dlp     --write-description --write-info-json  -icw  -o $locFN1  --restrict-filenames  --download-archive  ${yt_DW_archHistLog_FP}  $m11  $s11  $F11  $v11  $n11  $w11  $a11 $URL1"   ##--!!-the $a11 MUST be immediately before $URL1 without any other params inbetween!!

echo "================== START-fetching: ${url1}  : $(date) :"  | tee -a ${logfile1} ;
echo ${myInvok1}   | tee -a  ${logfile1} ;
echo ${cmd1}       | tee -a  ${logfile1} ;
echo; echo; echo "=========================================================================="  | tee -a ${logfile1} ;
${cmd1}   2>&1     | tee -a  ${logfile1} ;
echo; echo "================== END-fetching:  ${url1}  : $(date) ==============" | tee -a  ${logfile1} ;
[[ -z  ${s11} ]] && { [[ ! -d  ${descpDir1} ]] &&  mkdir ${descpDir1}   ;   mv   *json   *description  ${descpDir1}/ ; } 

echo; echo; echo "================== ERRORS-grep: ======================================" ;
grep -i error ${logfile1} ;

echo; echo "================== _END1_ =========================================================";
echo

