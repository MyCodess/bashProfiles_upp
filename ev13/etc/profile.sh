#!/bin/bash

set  -aC  +o history   ##--II- if needed backup old set-options: oldSets="$-" ; later: set -"$oldSets" : however this resets ONLY on-cases, BUT does NOT change off-cases!!
shopt  -s  expand_aliases
export HISTCONTROL=ignoreboth:erasedups

##--- tiny internal printline-func for profiles-debugging:
:  ${q_profsDebug11:=0} ; 
q_pls1 () { (( $q_profsDebug11 >9 )) &&  echo  "=====  :  $1" ; } ;  ##--start-print-liner
q_ple1 () { (( $q_profsDebug11 >9 )) &&  echo  "---    :  $1" ; } ;  ##--end-print-liner
declare -fx q_pls1  q_ple1 ;
q_pls1  "${BASH_SOURCE[0]##*/}"

##------------- Init1/1orgs/prev-vars (orgs from OS/System) : ---------------------
##--!!-do this before set -u !! in case that are not set! in non-interactive-shells they are NEVER set, since /etc/bash* is NOT executed bzw. is returned on arx!
##--II- Init1-vars may NOT be changed ever, and set ONLY the first time, to the OS-org-values !!
##--II- Init1-vars NOT prefix with q_ !! they must be really ReadOnly (declare -xr) and may NOT be chenged! but -xr reports error message if again sus ...! so ok!
Init1Path1=${Init1Path1:-$PATH} 
Init1PS1=${Init1PS1:-$PS1}
Init1HistFile=${Init1HistFile:-"$HISTFILE"}  ; 
##------------- __1END__ Init1/1orgs/prev-vars (orgs from OS/System) : ---------------------

set  -u  ##--I-must be after Init1-part !!
#
##--- myName/myPath/...:
myname11="${BASH_SOURCE[0]##*/}" ;
q_OrgCallParam="${BASH_SOURCE[0]}"       ##-I-  org-call-parameter, as this script was called by the user, eg ./up1/etc/profile.sh ; could be relative/absolute-path !
q_OrgCallParamDP="${q_OrgCallParam%/*}"       ##-I-  org-call-DIR  of this script by caller/user as it was called! it could be relative OR absolute! , as ./evXX/etc /OR /evXX/etc 
q_OrgCallAbsolutePhysDP="$(cd  -P  $q_OrgCallParamDP && pwd -P)"   ##-I-  org-call-DIR-full-absolte-RealPhysical-path  of this script by caller/user without links, only ohysical! but really NOT used! just for info! should NOT be used !!
q_OrgCallAbsoluteDP="$(cd   $q_OrgCallParamDP    && pwd -L)"   ##-I-MAIN-path-used !!  org-call-DIR-full-absolte-path  of this script by caller/user, as /tmp/tempu/up1/etc : ONLY-this/absolutepath will be uses for the rest of evEnv-vars!
q_OrgCallAbsoluteFP="${q_OrgCallAbsoluteDP}/${myname11}"         ##-I-NOT really used, but just for infos,..., abolute-FilePath of callein this profile

##--- user-presets-profile, if any,  before anything in const.sh:
: ${q_Profile2PresetsFP:="${HOME}/.profile2_ps.sh"} ;   ##--can be overwritten and located anywhere! even outside evv-tree,...
q_Profile2PresetsFN=${q_Profile2PresetsFP##*/}
[[ -r  $q_Profile2PresetsFP        ]]  &&  source   $q_Profile2PresetsFP       ; ##--user-preset-prof

##--- pathes-basics0 : evv, upp, const.sh, hostGlob, ...:
##--OK-if-hostnamectl-there:   Host1full="${Host1full:=$(hostnamectl  hostname)}" ;  ##--II-if hostnamectl not there, just set Host1full to anything you like or to hostname and then call evv1-profs !
: ${Host1full:=$(hostname)} ;  ##--II-if hostnamectl bzw. hostnamectl not in System/OS, just set Host1full to anything you like or to hostname, then rename the host-profile appropriately, and then  and then call evv1-profs !
: ${q_Hostname:=${Host1full%%.*}}     ##-II-for HOSTNAME-var-in-evv use ONLY this! no cmds/other-vars/...!! also this can be preset before calling evv-profiles ...!
q_EttcDP="${q_OrgCallAbsoluteDP}"
q_EvvDP="${q_EttcDP%/*}"                 ##-- eg: /up1/ev11
q_EvvDN="${q_EvvDP##*/}"
q_EvvDPPhys="$(cd  $q_EvvDP && pwd -P)" ##--physical/real-absolute-path of evvDP, only for curr-env-ID  used ! not using1
:  ${q_UppDP:="${q_EvvDP%/*}"}          ##-- path-of-/up1 ,default is parent-dir-of-evvDP ! so if /up1/ev11/... , then but /up1/, but  basically the up1-tree can be anywhere, even NOT-containing evv-files !
q_BinDP=${q_EvvDP}/bin
q_LOGNAME="$(id -un 2> /dev/null)"
INPUTRC="${q_EttcDP}/inputrc"    ##--instead of ~/.inputrc for bash-READLINE  ! see man  bash #goto--  /^READLINE
INPUTRC_mswin1="${q_EttcDP}/inputrc_mswin1"    ##--instead of ~/.inputrc for bash-READLINE  ! see man  bash #goto--  /^READLINE
q_ConstantsFN="const.sh"
q_ConstantsFP="${q_EttcDP}/${q_ConstantsFN}"
q_EttcD_DP=${q_EttcDP}/etcd    ##--I-more readable with _DP, due to verwechselung mit q_EttcDP ! here is etc.d so all users/hosts/... overwritings/more-configs,....
q_HostGlobEtcDP=${q_EttcD_DP}         ##--host-profs-global-file , now same as for users, but can be reset.

##-- gitPrompt: --------------
setGitPrompt1(){ q_gitPromptFP="${q_gitPromptFP:-${q_EttcD_DP}/git-prompt_arx1.sh}" ; export GIT_PS1_SHOWCONFLICTSTATE="yes" ; source  $q_gitPromptFP ; PS1='\[\033[33m\]\w\[\033[36m\] :`__git_ps1`:\[\033[0m\]\n$ ' ; }
##-- read notes in git-prompt_arx1.sh ! git-prompt.sh must be executed before setting PS1 in your env or evv-profiles ! it overwrites the your/evv-PS1 otherwise !
##--OR-without-coloring:  PS1='\w :`__git_ps1`:\n$' ; /OR (from arx1-git): export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ ' ;
#PS1 is slower with gitPS1, so if foo slow or no use, then go back to old PS1 without git-PS1 :
##____________________________

##--- syys-/hostGlob-presets-profiles:
: ${q_HostGlobProfFP:=${q_HostGlobEtcDP}/profile_${q_Hostname}.sh}    ##--can pre-set in users-presets to any other absolute-path!
q_HostGlobProfFN=${q_HostGlobProfFP##*/}                   ##--can pre-set in users-presets to any other path!
: ${q_HostGlobProfPosFP:=${q_HostGlobEtcDP}/profile_${q_Hostname}_pos.sh}    ##--can pre-set in users-presets to any other path!
q_HostGlobProfPosFN=${q_HostGlobProfPosFP##*/}

##--- basics0:
##--OK1-PS1_without_gitPS1--default_evv-onlyCuDir
PS1=${PS1:-"\\W : "}   ##--PWD-in-extra-line:  PS1=${PS1:-"\w\n\\W : "} ##--incl-user@host:  PS1=${PS1:-"[\\u@\\h \\W]\\\$ "}  ##--II- in non-interactive-shells PS1 is NOT set! so just  due to "set -u" above set a default here !! 
q_uname1infs=$(uname -a) ; q_uname1infs=${q_uname1infs^^} ; q_mswinos1=0  ##--plattform is linux as default ; q_uname1infs all capital-letters !
[[ $q_uname1infs  =~ "MSYS"|"CYG"|"MING"|"MICROSOFT" ]] && q_mswinos1=1  ##--if plattform is mswin with cygwin or git-bash/MINGW64
##----

##====== evv-profs: ==========================================================
##--II-  q_Profile2PresetsFP  is already executed in above line, so can user PREset everything! now the rest-sequence:
[[ -r  $q_HostGlobProfFP     ]]  &&  source  $q_HostGlobProfFP    ; ##--syys-host-preset-prof
[[ -r  $q_ConstantsFP        ]]  &&  source  $q_ConstantsFP       ;
[[ -r  $q_PathesFP           ]]  &&  source  $q_PathesFP          ;
[[ -r  $q_HostGlobProfPosFP  ]]  &&  source  $q_HostGlobProfPosFP ; ##--syys-host-preset-prof
[[ -r  $q_AliasesFP          ]]  &&  source  $q_AliasesFP         ;
[[ -r  $q_Funcs1FP           ]]  &&  source  $q_Funcs1FP          ;
[[ -r  $q_Funcs2FP           ]]  &&  source  $q_Funcs2FP          ;
[[ -r  $q_ProfCu1FP          ]]  &&  source  $q_ProfCu1FP         ;
[[  $q_mswinos1 == 1 && -r  $q_mswinProfFP  ]]  &&  source  $q_mswinProfFP  ;
[[ -r  $q_prj0ProfFP         ]]  &&  source  $q_prj0ProfFP        ;
[[ -v DESKTOP_SESSION  &&  -r  $q_XWinsProfFP   &&  (( $q_XWinsProfDone < 1 )) ]]  &&  source  $q_XWinsProfFP  ;
##--II-  q_Profile2FP will be at the END executed, so user can OVERwrite everything after the above seq !
##====== =====================================================================
set -a  ##-- in case that was reset.

##--!!- diffs users and roots:
(( $(id -u) > 99 )) && {
	umask 0002  ##--i- only not-root-users umask is g+w
	:  ${q_rootBinsPath:="/sbin:/usr/sbin:/usr/local/sbin"}
	for ii in ${q_rootBinsPath//:/  } ; do  pathaddend  ${ii} ; done ;
} || {
	umask 0022
	q_rootBinsPath=""
}

##--- pathes-adds...:
#--II- !! put no-NW-pathes in global PATH, otherwise long wait times by eg. cmd-typos ,...
pathaddend  "${q_BinDP}"
pathaddend  "${opptuDP}/bin"
pathaddend  "${HOME}/.local/bin"
PATH="${PATH//::/:}"  ##--removing redundant ::
q_Path1="$PATH"    ##--II- the final-evv-path after first full evvEnv-run. can be used in sub-scripty (prj0,...) as iniitial-evv-path!!
##---------------

##--- shell-options + ENVs : the last settings for the shell!:
export GLOBIGNORE='.:..:'  ##-II- it also enables dotglob , see man bash !!
#--I- no-hss:  unset HISTFILE ; shopt -uq histappend  ##--/OR for current shell not at all:  set +o history !
HISTSIZE=10000 ; HISTTIMEFORMAT="     ${dateTimeForm1}   " ;
##-- very END, shopts has relevance for all ux-cmds as ls/find/....!! :
shopt -s  dotglob cmdhist  expand_aliases  extglob  histreedit  histverify interactive_comments  lithist  mailwarn  no_empty_cmd_completion  promptvars  shift_verbose
[[ -r  ${q_Profile2FP}   ]]  &&  source  ${q_Profile2FP}  ##--currUser-Profs: overwrites everything if needed; if presets are required, set them BEFORE invoking this profile.sh !!!

q_ple1  "${BASH_SOURCE[0]##*/}"
set +u -hBC -o errtrace  -o emacs  -o functrace  -o histexpand  ;  ##--!!- ONLY at the very end: set -o history  +a +e
set -o history +a +e

