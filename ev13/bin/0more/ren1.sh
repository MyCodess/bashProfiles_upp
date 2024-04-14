#!/bin/bash
set -u

##=================== USAGE: ========================================
##__ USAGE11="USAGE for renaming a single file:\n  ${0##*/}  [-sviV -h] [-b] <filename> <Search-Word>   <Replacement-Word> \n  with -b == backup-file-before-renaming ;\n  eg-usage:  find . -xdev -depth -iname '*_*' -exec ren1.sh -sviV -b {} _ - \; |tee -a $($cudts)-${0##*/}.log" ;
show_help11(){
cat<<OUTTXT11
USAGE for renaming a single file by converting the String-Parameter \$2 to \$3 :
  ${0##*/}  [-sviV -h] [-b]  <filename>  <Search-String>   <Replacement-String>
  with -b == backup-file-before-renaming

eg-usage:
  find . -iname '*_*' -exec ren1.sh  -siV -b {}  '_'  '-' \;
  for ii in  *_*  ; do      ren1.sh  -siv -b  "$ii"  'xyz'  '123' ; done 
  find . -xdev -depth -iname '*_*'  -exec   ren1.sh  -siVb  {} _ - \;  |  tee -a $($cudts)-${0##*/}.log ;
OUTTXT11
}
##=====--END--======= USAGE: ========================================

declare -x  opt11=b ;  ##--backup-option , default==NO-backup
declare -xi opt11_val=0
getoptsdef3 $@ ; shift $(($OPTIND - 1)) ;
#USAGE11="$USAGE11 \n $getoptsdef3_usage11" ;
USAGE11="$(show_help11) \n $getoptsdef3_usage11" ;

##--OK-also-but longer! just use -h too see formatted-help!:   (( $# < 3 )) && { echo; help11 ; echo; echo  "$getoptsdef3_usage11" ; echo; exit 3 ; }
fn1="${1}"
s1="$2"
r1="${3:?$(show_help11)}"
#r1="${3:?$(show_help11) $getoptsdef3_usage11}"

cmd_1='mv  --strip-trailing-slashes '
(( $verboseit11  > 0 )) &&  cmd_1="$cmd_1 -v ";
(( $interact11   > 0 )) &&  cmd_1="$cmd_1 -i ";
(( $opt11_val    > 0 )) &&  cmd_1="$cmd_1 --backup=numbered  ";
(( $simulit11    > 0 )) &&  cmd_simul="echo ";
$cmd_simul  $cmd_1  "$fn1"     "${fn1//$s1/$r1}"


##------------- more ----------
##---logfile: logfile not needed for one file!, otherwise just add this to final cmd:     | tee -a $logFN11
##__if-liked:		(( $logit11      > 0 )) &&  (( $verboseit11  > 0 )) &&  echo "see also the logfile $logFN11";
##__piping-did-not-work-with-VAR! was taken as string! :	(( $logit11  > 0 )) &&  cmd_1_logSuffix="  | tee $logFN11";

