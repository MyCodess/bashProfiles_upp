

#####  ==========  pre-evv1-profs:  ##############################################################
set +o history
export  HISTCONTROL="ignoreboth:erasedups"
unset   HISTFILE
##________________________________________  ___________________________



#####  ==========  my-name/-path/-call (setevv.sh) : #############################################
export  setevv1_FP="${BASH_SOURCE[0]}" ;
export  setevv1_FN="${BASH_SOURCE[0]##*/}" ;
export  setevv1_DP="${BASH_SOURCE[0]%/*}" ;
alias   setevv1='source  ${setevv1_FP}'
alias   setevv1unset='unset ${!q_@}  ${!syys@} ; source  ${setevv1_FP}'
alias   visetevv1="vi1  ${setevv1_FP}"

##--- call-evv-profs:
alias   sus1="source  /var/tmp/tmpu/up1/.ev13/etc/profile.sh"
source  '/var/tmp/tmpu/up1/.ev13/etc/profile.sh'
##________________________________________  ___________________________



#####  ==========  pos-evv1-profs:  ##############################################################
set -au
export  HISTCONTROL="ignoreboth:erasedups"
unset   HISTFILE

##===== apps/SWs/...-pos: =========================
export  q_ettcLoc1_DP="${HOME}/.config/etcu"  ##--due to RZ-kramm of ofc1, not using etcu/etcau, ...!
##--- myssqls_cons1: -----
export  q_mysConf1_FP="${ettcUser}/${q_mysConf1_FN}"

set +au
##________________________________________  ___________________________
