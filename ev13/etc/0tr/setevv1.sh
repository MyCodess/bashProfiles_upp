#!/bin/bash


#####  ==========  append follwoing lines UNcommented in cyg/msys to your .bashrc:
##__UnComment:   source  "${USERPROFILE}/ofc1/bin/setevv1.sh"  ; bind -f  "$INPUTRC"
###________________________________________  ___________________________

############################# 1evv-mswin-ofc1-preSets: ####################################
set -a


#####  ==========  my-name/-path/-call (setevv.sh) :
##__1debug:  echo  "${BASH_SOURCE[0]##*\\}"    "${BASH_SOURCE[0]}"   ##--II-for mswin must "\\" insteat "/"
setevv11_mswin_FP="${BASH_SOURCE[0]##*/}" ;
setevv11_FP="$(cygpath ${setevv11_mswin_FP})"
myname11="${BASH_SOURCE[0]##*/}" ;
export setevv11_FP="$setevv11_FP"
alias  setevv11="source  ${setevv11_FP}"
###________________________________________  ___________________________


############################# call evv-profiles : #########################################
##__ 
export  q_profsDebug11=10 ; 
export  q_Hostname='2310msw'   ##--if-needed/not-working, denn:   Host1full="2310msw"   ##--prev: devvdi1 , now same-as its syystg !  ##2310-ofc1-host1--Dev_VDI_1
source  "${USERPROFILE}"/up1/.ev13/etc/profile.sh    ##--did-not-work:  "C:\Users\DKX8H1N\up1\.ev13\etc\profile.sh"
