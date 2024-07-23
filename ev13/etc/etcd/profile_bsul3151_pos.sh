##__  #!/bin/bash
set -a

export  HISTCONTROL="ignoreboth:erasedups"
export  HISTIGNORE="*pwd;*:*ls;*:*ll;*:"
export  HISTTIMEFORMAT=" ${dateTimeForm1} "
unset  HISTFILE
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; psl  "$myname11" ;


#####  ==========  pos-pathes/syys/host/SWs/... host-specifics...:
##__  export  SMOKE_TESTS=1
export  PR1_ID_cu=${PR1_ID_cu:=524}
export  PR1_DP="/opt/netservices/instances/PR-${PR1_ID_cu}/current/netservices"
alias   cdpr1="cdlla  ${PR1_DP}"
alias   setsmoke='declare -ix  SMOKE_TESTS=1;  declare -p SMOKE_TESTS'
alias   unsetsmoke='unset SMOKE_TESTS'
##________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"
