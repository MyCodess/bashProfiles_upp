##__  #!/bin/bash
set -a

export  HISTCONTROL="ignoreboth:erasedups"
export  HISTIGNORE="*pwd;*:*ls;*:*ll;*:"
export  HISTSIZE=30
unset   HISTTIMEFORMAT
unset   HISTFILE
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; psl  "$myname11" ;


#####  ==========  pos-pathes/syys/host/SWs/... host-specifics...:
##__  export  SMOKE_TESTS=1
export  q_PR1_ID_cu=${q_PR1_ID_cu:=582}
export  q_PR1_DP="/opt/netservices/instances/PR-${q_PR1_ID_cu}/current/netservices"
alias   cdpr1='cdlla  ${q_PR1_DP}; pwd -P'
alias   setsmoke='declare -ix  SMOKE_TESTS=10;  declare -p SMOKE_TESTS'
alias   unsetsmoke='unset SMOKE_TESTS'
##________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"
