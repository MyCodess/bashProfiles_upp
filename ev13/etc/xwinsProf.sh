#!/bin/bash
set  -u
set  -a

myname11="${BASH_SOURCE[0]##*/}" ;
q_pls1  "${myname11}" ;
##--II-xwins-profiles ONLY in case of a running x-server / Desktop-Env!!
q_cu_hostid="$(hostid)" ;
##__ do-this-for now manualyy/alias:    xmodmap  -e  "clear Lock" ##__?? xmodmap  -e  "remove Lock = Caps_Lock"
xmodmap  -e  "keycode 66 ="    ##--caps-lock-key-deactivation/disabling !

##----- X-Allg-settings if needed:       ##--OR:   [[  $DESKTOP_SESSION ]]  && {... } ##__  >/dev/null  2>&1 
xhost  +local:""  >/dev/null  2>&1  ;    ##--OR-open-for-all:     xhost +    >/dev/null  2>&1   ##--Display-opennin for ALL !!
xset -b ; ##--no-beeps in X11
##________________________________________

#-if-dones-flags-still-needed!?:   q_XWinsProfDone=1
##__ q_ple1  "${myname11}---${syysNoTg}${osTg}_${q_Hostname}_${diskTg}---${osRelTg}"
q_ple1  "${myname11}" ;
