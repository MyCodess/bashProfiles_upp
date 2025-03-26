#!/bin/bash
set -a

#####  ==========  pre-evv1-profs:  ofc1_msw : ###################################################
##__debug:  echo "___p1:  ${BASH_SOURCE[0]}"  ##--is-msw-path-format!
##__put-in-your-profile:   source  "${USERPROFILE}/ofc1/bin/setev1.sh"  ; bind -f  "$INPUTRC"
##__1debug:  echo  "msw:  ${BASH_SOURCE[0]##*\\}  , Lx:  ${BASH_SOURCE[0]}"   ##--II-for mswin must "\\" instead "/"
#export  setevv_mswin_FP="${BASH_SOURCE[0]##*/}" ;
##_ok1:  export  setevv_mswin_FP="${BASH_SOURCE[0]}" ;   ##--II- [0] is msw-form:   C:\Users\DKX8H1N\ofc1\bin\setev1.sh
##________________________________________  ___________________________



#####  ==========  my-name/-path/-call (setevv.sh) : #############################################
export  setevv_FP_orgcall="${BASH_SOURCE[0]}" ;   ##--I-keep it; in msw or other systems is different than setevv_FP !
#_Lx:   export  setevv_FP="${setevv_FP_orgcall}" ;   for msw take the cyg-version:
export  setevv_FP="$(cygpath ${setevv_FP_orgcall})"  ##--Lx:  export  setevv_FP="${BASH_SOURCE[0]}" ;
export  setevv_FN="${setevv_FP##*/}" ;
export  setevv_DP="${setevv_FP%/*}" ;
alias   setevv='source  ${setevv_FP}'
alias   setevvunset='unset ${!q_@}  ${!syys@} ; source  ${setevv_FP}'
alias   visetevv='vi1  ${setevv_FP}'
alias   cdsetevv='cdl  ${setevv_DP}'

##--- call-evv-profs on "2310msw" host:
export  q_profsDebug11=00 ;   (( $q_profsDebug11 >9 )) && { echo "=====  :  ${setevv_FN}" ; }  ##--set to 10 to see debugs !
export  Host1full="2310msw"  ##--I-will-not-work-with-sus1unset if only:  export  q_Hostname='2310msw' #-:it will be unset also !
export  USER=${USERNAME:-"userXX"}   ##--I-for msw , if USER not set !?
source  "${setevv_DP}"/up1/.ev13/etc/profile.sh    ##--did-not-work:  "C:\Users\DKX8H1N\up1\.ev13\etc\profile.sh"
##--old-HOME-dir-up1:  source  "${USERPROFILE}"/up1/.ev13/etc/profile.sh    ##--did-not-work:  "C:\Users\DKX8H1N\up1\.ev13\etc\profile.sh"
##________________________________________  ___________________________



#####  ==========  pos-evv1-profs:  ##############################################################
set -au
set +au
##________________________________________  ___________________________

q_ple1  "${BASH_SOURCE[0]##*/}"

