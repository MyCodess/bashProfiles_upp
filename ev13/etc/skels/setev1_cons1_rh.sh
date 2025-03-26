#!/bin/bash
set -a

#####  ==========  pre-evv1-profs:  ##############################################################
set +o history
export  HISTCONTROL="ignoreboth:erasedups"
unset   HISTFILE
##--- myssqls_cons1 overwritings: -----
export  q_mysUsr1=netservices
export  q_mysAdm1='root'
export  q_mysUsr1PW1=" "
export  q_mysAdm1PW1=" "
export  q_mysHost1=bsul3151
export  q_mysDB1=netservices
##________________________________________  ___________________________



#####  ==========  my-name/-path/-call (setevv.sh) : #############################################
export  setevv_FP_orgcall="${BASH_SOURCE[0]}" ;   ##--I-keep it; in msw or other systems is different than setevv_FP !
export  setevv_FP="${setevv_FP_orgcall}" ;
export  setevv_FN="${setevv_FP##*/}" ;
export  setevv_DP="${setevv_FP%/*}" ;
alias   setevv='source  ${setevv_FP}'
alias   setevvunset='unset ${!q_@}  ${!syys@} ; source  ${setevv_FP}'
alias   visetevv='vi1  ${setevv_FP}'
alias   cdsetevv='cdl  ${setevv_DP}'

##--- call-evv-profs:
source  "${setevv_DP}"/up1/.ev13/etc/profile.sh
##________________________________________  ___________________________



#####  ==========  pos-evv1-profs:  ##############################################################
set -au
export  HISTCONTROL="ignoreboth:erasedups"
unset   HISTFILE

##===== apps/SWs/...-pos: =========================
export  q_ettcLoc1_DP="${HOME}/.config/etcu"  ##--due to RZ-kramm of ofc1, not using etcu/etcau, ...!


set +au
##________________________________________  ___________________________
