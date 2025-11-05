##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"
set -a
#################### oneLiner-funcs mainly ! #################################################################

##========== echo-line1s +msg +date/end-tag : ======================================
##--USAGE1:  el1/el1d/el1e/el1de  [msg1] , ... :
el1(){   echo; echo  "${q_fold1Sm} ${1:-==========} ==================================================__________" ; }
el1e(){  echo; echo  "${q_fold1Em} ${1:-==========} ${q_Tag1End} __________" ; }
el1d(){  echo; echo  "${q_fold1Sm} ${1:-==========} ========== $($cudts2) : =====================__________" ; }
el1de(){ echo; echo  "${q_fold1Em} ${1:-==========} ${q_Tag1End} : $($cudts2) __________" ; }

##################### users-functions, allg-usages :################################
##-- calculations :
bc1(){ echo "scale=${2:-5} ; $1" | bc ;}
b2mb(){ echo "$*" | awk '{print $1 " Bytes =="; printf "%.3f KB \n%.3f MB\n%.3f GB\n", $1/1024, $1/1024/1024, $1/1024/1024/1024}' ;}   # calculating bytes to MB...
k2mb(){ echo "$*" | nawk '{ printf "% KB \n%.3f MB\n%.3f GB\n", $1, $1/1024, $1/1024/1024}' ;}   # calculating KBytes to MB...
llmb(){ ls1 -l "$@" | nawk 'NF >6 {print $5/1024/1024 "    \t" $9}' | sort -nr ; }   ##--simple MB-size-converted of ls ; for more detailed one use: lls
lls1(){ ls1 -ls -h --time-style=full-iso  "$@"  | sort -n ; }
lls2(){ ls1 -l "$@" | nawk 'BEGIN{OFMT="%.1f"}; NF >6 {OFMT="%.1f"; printf "%15d B| %15.3f KB| %10.3f MB| %6.3f GB| %s\n", $5, $5/1024, $5/1024/1024, $5/1024/1024/1024, $NF}' | sort -n; } ##--files sizes calculated in KB7MB/GB based on ls -l output (adapt it to different formats !!):
#-old: more details, not formatted: lls(){ ls -l "$@" | nawk 'BEGIN{OFMT="%.1f"}; NF >6 {print $5  " B | " $5/1024 " KB | " $5/1024/1024 " MB | " $5/1024/1024/1024 " GB | "  $6 "  " $7 "  " $8 "  " $NF}' | sort -n; }
# total size of all files, which are newer then $1 :
sizeNewer(){ find . -newer $1 -ls | awk ' { sum_B += $7 ; print } END{ OFMT="%.2f" ; print "==== total size:  " sum_B " Bytes  ==   " sum_B / 1024 " KB  == \t " sum_B /1024  / 1024 " MB" }'; }

##--- cdlla-funcs:
cdll()    { cd  "$*"  && ll    && pwd ; }
cdlla()   { cd  "$*"  && lla   && pwd ; }
cdllat()  { cd  "$*"  && llat  && pwd ; }
cdllt()   { cd  "$*"  && llt   && pwd ; }
alias  cdl='cdll' ; alias  cdla='cdlla' ; alias cdlat='cdllat' ; alias  cdlt='cdllt'

##--- MS-Windows-path cd , replacein / with \ and ... :
cdwinpath(){
	winPath1=${1:?"USAGE: ... MS-Windows-PATH-and-ESCAPED-from-shell "}
	##--i- all-sh-ver: cd $( print -r "$1" | sed -e 's@\\@/@g' -e 's@^O:@/autofs/orashare@' ) && ls && pwd ;
	cd ${winPath1//\\/\/}  && ls -l && pwd ;
}

##--- find_funcs-evv :
#- mtime-sorted-find ; sort/find files recursively based on their mtime:
finddatesort(){ find ${1:-.}   -type f -printf "%Ty%Tm%Td-%TH:%TM  %p\n" | sort -n ; }
finds(){ find ${@:-.}  | sort ; }  ##--/OR rename?:  findsort1
#- find files -iname *$1* :
findin(){
	local USAGE1="USAGE: ... <start-Dir> <file-name-part> [xxx-more-params]";  local path1="$1" ;  local namePart1="${2:?$USAGE1}"  ; shift; shift;  ##--II-shifts due to more arbitrary params!
	set -x;   find  "$path1"  -xdev  -iname "*${namePart1}*"  $* | sort ; set +x ;
}
#- find DIRs -iname *$1* :
findind(){
	local USAGE1="USAGE: ... <start-Dir> <file-name-part> [xxx-more-params]";  local path1="$1" ;  local namePart1="${2:?$USAGE1}"  ; shift; shift;  ##--II-shifts due to more arbitrary params!
	set -x;   find  "$path1"  -xdev  -iname "*${namePart1}*" -type d  $* | sort ; set +x ;
}
#-find all modified files/dirs by vide, based on evv-date-stamp of -nnnnnn ; regex take the WHOLE path for match, NOT the filename!! so why / in second pattern :
findmodifs1(){ find  ${1:-./}  -regextype sed  -regex  '.*/[0-9]\{6\}-.*'  -o  -regex '.*-[0-9]\{6\}$'  -o  -regex  '.*-[0-9]\{6\}-.*' | sort ; }

##---
bm1gr(){ grep  -i  "${1}"   "$filesBM1_FP" ; }

##-- ll-in-PATH ; ll with wild cards in PATH-DIRs (No sub-dirs !)
llinpath() { for ii in ${PATH//:/  } ; do ls1 -l ${ii}/*${1}*  2>/dev/null ; done ; }
lsinpath() { for ii in ${PATH//:/  } ; do ls1    ${ii}/*${1}*  2>/dev/null ; done ; }

##--UX-core-utils-funcs:
manv(){ man "$@" | ul -i | view1 - ; }  ##--man-pages in vim-view
mman(){ vi1 ${prj1DocDir}/mans/${1}.man ; }
mkdircd() { p1=${1:?"USAGE: ... <dir-name-for-mkdir-cd>"} ; mkdir -p "$p1" && cd "$p1" && ls && pwd ; }

##--- 2So-cp/mv:
cp2so(){ fn1=${1:?"usages-params:   <filepathes-to-copy-to-2SoDir ... >"} ;  cp  -v -a  "$@"   "${tosoDP}" ; }
mv2so(){ fn1=${1:?"usages-params:   <filepathes-to-move-to-2SoDir ... >"} ;  mv -iv     "$@"   "${tosoDP}" ; }

##--- 
whichv(){ fpath=`which $1 ` ; [[ -f $fpath ]] &&  view $fpath || echo "--- Not found:  $fpath "  ; }
whichll() { p1=${1:?"USAGE: myname command-lokking-for"} ; path1=`which $1`; [[ -z ${path1##no *} ]] && echo " --- Not found: $path1" && return 5 ; "ls" -l $path1 ; }

##--- String-funcs:
function strcomp1() { if [[ "$1" = "$2" ]]; then echo -e "OK-same:\n $1 \n $2" ; return 0 ; else echo -e "Not-identical:\n $1 \n $2" ; return 3 ; fi ; } ##--compare two strings $1,$2 if they are identical/same !

##---
zipsListing(){ find $1  \( -iregex ".*.tgz\|.*.tar.gz\|.*.tar" -printf "\n\n\n===== %p :\n" -exec tar -tvf {} \; \) -o \( -iname "*.zip" -printf "\n\n\n===== %p :\n" -exec unzip -l {} \; \)  > {$1}-zips.toc.log; }

##--- VIMs/views/...:
# View Latest file in DIR=$dir2check ; default=. ; /OR with ls -lst |  sed -n '$p' :
vla(){ dir2check=$1 ; latestFile=$( ls -t1 $dir2check  | sed  '1q' )  && echo  "=== latest file is: $dir2check/$latestFile" && view $dir2check/$latestFile ; }

##--- converters (text/html/pdf/...):
htm2txt(){ curl -s "$1" | pandoc1 -f html -t plain ; }  ##-pandoc-execs must be installed and aliased as pandoc1


######################### DateTimeStamped-mv/-cp : #############################################################
#- d=dateStr , t=dateTimestr , b=beginning-of-file-name, e=end-of-file-name
##-- (internal) sub-func to generate ALL needed date-time-stamped-FileNames/FilePaths :
##--!!--keep in mind: for adding comments-param ($3) it is MANDATORY giving $2/New-DIR-Path ! is ok as "" /OR "." ,... !!
dtFPgen()  {  ##--Date-Timed-FilePath-Generation for all timestamped mv/cp/... :
	sourceFP11="${1:?'USAGE: ... <source-file-name/path> [new-DIR-path-if-not-same-as-sourceDP [comments-addies-to-FP-end] ]'}" ;
	[[ "$sourceFP11" != */* ]] && sourceFP11="./${sourceFP11}" ;
	fn11="${sourceFP11##*/}";     sourceDP11="${sourceFP11%/*}/";
	dp11="${2:-$sourceDP11}/" ; ##-Target-DP if fully other than cu-DP !
	cuds11="$($cuds)" ; cudts11="$($cudts)" ;  ##--today-date/time-tag
	cuds11_mod_srcFP=$($cuds  -r  "$sourceFP11") ; cudts11_mod_srcFP=$($cudts  -r  "$sourceFP11") ;  ##--last-modiied-date/time-tag of the source-file
	addies11="${3:+--$3}" ;
	##__ cleaning FPs so evv-FP-conv :
	retval11="" ; cleanFP1 "${fn11}" ; fn11="${retval11}" ;
	retval11="" ; cleanFP1 "${dp11}" ; dp11="${retval11}" ;
	##__  echo $fn11 ; echo $sourceDP11 ; echo $dp11 ; echo "_______________" ;
	newfn11_d="${cuds11}--${fn11}${addies11}"    ;  
	newfn11_de="${fn11}--${cuds11}${addies11}"   ;   
	newfn11_dt="${cudts11}--${fn11}${addies11}"  ;  
	newfn11_dte="${fn11}--${cudts11}${addies11}" ;
	newfn11_mod_de="${fn11}--${cuds11_mod_srcFP}${addies11}" ;
	newfn11_mod_dte="${fn11}--${cudts11_mod_srcFP}${addies11}" ;
	##__  echo $newfn11_d ; echo $newfn11_dt ; echo $newfn11_de ; echo $newfn11_dte ; echo "_______________" ;
	##-- not-needed-anymore for this new call with 3 params! :  newdp11="${dp11}/${subDN11}" ; 
	##__ removing redundant "/"  is done now in cleanFP1 ! old:  newdp11=$(echo $newdp11 |  tr -s   "/") ;     ##--sed-variation:   sed -e 's@//*@/@g'
	newfp11_d="${dp11}${newfn11_d}"        ;
	newfp11_de="${dp11}${newfn11_de}"      ;  
	newfp11_dt="${dp11}${newfn11_dt}"      ;  
	newfp11_dte="${dp11}${newfn11_dte}"    ;  
	newfp11_mod_srcFP_de="${dp11}${newfn11_mod_de}"    ;  
	newfp11_mod_srcFP_dte="${dp11}${newfn11_mod_dte}"    ;  
	##__  echo $newfp11_d ; echo $newfp11_dt ;  echo $newfp11_de ; echo $newfp11_dte ; echo "_______________" ;
}
okAsk1()   { read -p "___ OK?? (CTRL-C or ENTER) : $* ___" ; }
cleanFP1() {
	##--cleaning the string1 (a VAR/FP/FN/...) from non-alnum  and multiple "/" , but leave multiple --,...! just basic-simple-clean (not so comprehensive as renFilesEvv.sh, but similar) :
	local USAGE11='cleanFP1 <string1> ;  myFP11="${retval11}" ; : it cleans string1/FP1 of non-alnum and multiple / and set predefined-/global-var retval11 to it !';
	retval11="" ;  retval11="${1:?$USAGE11}";
	retval11="$(echo $retval11 | sed  -e 's@//*@/@g'   -e 's@[^[:alnum:]/_.-]@_@g'  -e 's@^[-_]*@@'  -e 's@_\.@.@'  -e 's@__*@_@g' )";  ##--I-could use \+ instead * for 0ne-or-more, but is GNU-extension! so leave it so maybe!? 
}
##---
cpt1="cp  -ixv  -d --preserve=timestamp";  mvi1="mv  -iv   --strip-trailing-slashes";  ##--I-as aliases does NOT work properly cpt/mvi, so here defined as VARs !
dtRename1() {
	local cmd111="$1"  ; local oldFP111="$2" ;
	local newfp111="${3:?'USAGE: dtRename1 <cmd> <old-FP> <new-FP>  : move/copy a file with a Date-/time-stamped newName '}" ;
	##--I-if confirmation prefered:   okAsk1 "${cmd111}  ${oldFP111}  --->   ${newfp111}"  &&  ${cmd111}  "${oldFP111}"   "${newfp111}"  ;
	${cmd111}  "${oldFP111}"   "${newfp111}"  ;
}
##---
cpd()     { dtFPgen "$@" ;  dtRename1  "$cpt1"  "${sourceFP11}"  "${newfp11_d}"    ; }
cpde()    { dtFPgen "$@" ;  dtRename1  "$cpt1"  "${sourceFP11}"  "${newfp11_de}"   ; }
cpdt()    { dtFPgen "$@" ;  dtRename1  "$cpt1"  "${sourceFP11}"  "${newfp11_dt}"   ; }
cpdte()   { dtFPgen "$@" ;  dtRename1  "$cpt1"  "${sourceFP11}"  "${newfp11_dte}"  ; }
##---
mvd()     { dtFPgen "$@" ;  dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_d}"    ; }
mvde()    { dtFPgen "$@" ;  dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_de}"   ; }
mvdt()    { dtFPgen "$@" ;  dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_dt}"   ; }
mvdte()   { dtFPgen "$@" ;  dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_dte}"  ; }
##-- file-modified-date/time-as-timestamp_renaming: (can also use stat or ls cmds):
mvde-mod()    { dtFPgen "$@" ;   dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_mod_srcFP_de}"    ; }
mvdte-mod()   { dtFPgen "$@" ;   dtRename1  "$mvi1"  "${sourceFP11}"  "${newfp11_mod_srcFP_dte}"    ; }
##__ direct-variation:  mvde-filemod() { mvi "$1"  "${1}"_$($cuds  -r  "$1") ; }
##--2do??:  here read query can be deleted later. ist is asked already in cpd bzw. okAsk1 , but for now ok...:
vid()   { cpd "$@"   ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 $sourceFP11 ; }
vide()  { cpde "$@"  ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 $sourceFP11 ; }
vidt()  { cpdt "$@"  ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 $sourceFP11 ; }
vidte() { cpdte "$@" ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 $sourceFP11 ; }
vide-org()  { cpde  "$@" ""  ${q_Label1org} ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 ${sourceFP11} ; lla  ${sourceFP11}* ; }
vidte-org() { cpdte "$@" ""  ${q_Label1org} ; read -p "___ editing ok??  Enter or Ctrl-C : " ; vi1 ${sourceFP11} ; lla  ${sourceFP11}* ; }
##--- more-stamped-mv/cp-funcs:
##--not-needed-any-more--cp_cmd_hat_it_now-with  cp --parents ... ;  cppath(){ USAGE11="Usage:  copies-including-source-PATH <source-path> <target-Dir>"; ${2:?"$USAGE11"} ; tar -cp "$1" | tar -xpv -C "$2"  ; }
############ __1END__ ### DateTimeStamped-mv/-cp : #############################################################

##== gitPrompt: =========================================
setgitprompt1(){ 
	export q_gitPromptFP="${q_gitPromptFP:-${q_EttcD_DP}/git-prompt_arx1.sh}" ; export GIT_PS1_SHOWCONFLICTSTATE="yes" ;
	source  $q_gitPromptFP ;      ##--OK1-undefined-vars:  set +u ; source  $q_gitPromptFP ; set -u ;
	source  $q_gitPromptFP ;  PS1='\[\033[33m\]\w\[\033[36m\] :`__git_ps1`:\[\033[0m\]\n$ ' ;
}
##-- read notes in git-prompt_arx1.sh ! git-prompt.sh must be executed before setting PS1 in your env or evv-profiles ! it overwrites the your/evv-PS1 otherwise !
##--OR-without-coloring:  PS1='\w :`__git_ps1`:\n$' ; /OR (from arx1-git): export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ ' ;
#PS1 is slower with gitPS1, so if foo slow or no use, then go back to old PS1 without git-PS1 :
##____________________________

q_ple1  "${BASH_SOURCE[0]##*/}"


############################################# prev/coll/arc/tr/tmp/... : #############################################
##--- renamings-evv:
#- alnum-renaming-simple: unfortunaely find does NOT lookup funcs! so rewritten as script!:
#- renFileAlnum1(){ fn1="$1" ; mv -inv "$fn1" "$( echo "$fn1" | sed  -e 's@[^[:alnum:]/_.-]@-@g' )" ; }
##---
#-- put noNupFlag-file in the target DIR (cache,tmp,...) $1, to exclude it from bup/tars.
#-- only limited-functionality as function! see/use its script in q_BinDP! : putNoBupFlag(){ local  targetDir1=${1:?"USAGE: ... <target-dir to be excluded from tar.>"} ; cp -v $q_NobupsFlagTplFP  ${targetDir1}/${q_NoBupFlagFN}; chown -v --reference="${targetDir1}"  "${targetDir1}/${q_NoBupFlagFN}"; }
##---
################## __1END__ ################# prev/coll/arc/tr/tmp/... : #############################################
