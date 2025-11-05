#!/bin/bash
set -a

#####  ==========  alp1-bash-evv:
#- call-container with host-share:  docker run --rm  -it --name alp1bash  --hostname  alp1  -v  /up1/varu/varau/docks1_var/share1:/mnt/host11  alpine:bash1  /bin/bash

##_______:  done-nts:
# cd / ; ln -s /mnt/host11/up1/
# vi aliases.sh  #-: ls1 : lp1 ls does NOT have date-iso option ! below adding is ok, but for cdllX-funcs is to late! so modif there also

##_______:  pre-settings:
export  q_profsDebug11=10
source  /up1/.cev/etc/profile.sh

##_______:  pos-overwritings:
alias  ls1='ls   -p  --group-directories-first  --color=never'  ##--alp1 ls does NOT have date-iso option !
alias  ls1c='ls  -p  --group-directories-first  --color=auto'
#-- prompt with hostname:
#-2lines:  PS1=$"\n\h@\w\n\h : \\W : "
PS1="[\\u@\\h \\w]\\\$ "

##________________________________________  ___________________________

set +a
