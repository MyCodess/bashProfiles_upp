##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"
set -a

##========== 2chk/wk-cu:
##__  TIME_STYLE=posix-long-iso

#################### here only tr/cu1/testies/checkies/to.see/tr-tasks/... : NON-persistents ...! ############
##----- NWs_Wlans_spaSup_OS : --------------------------------------
##--
wpaSup_confDP="/etc/wpa_supplicant"
wpaSup_EvvConfFN="${q_Label1qq}wpa-wlans1.conf"
wpaSup_EvvConfFP="${wpaSup_confDP}/${wpaSup_EvvConfFN}"
##--
alias cdnwwpaSup="cdlla  ${wpaSup_confDP}"
alias vinw-wpaSup="sudo vi -o   ${wpaSup_confDP}/*";
alias os1nwrestart="sudo  systemctl   restart   dhcpcd.service  wpa_supplicant.service"
##__ NWMgr-restart-old1:  alias os1nwrestart="sudo  /bin/systemctl stop network-manager.service;  sudo  /bin/systemctl start network-manager.service;"  ##--!!-do-NOT use restart!! see man systemctl !  --old-initV-but-ok:  sudo  service  network-manager  --full-restart ;

##----- NWs_Wlans_wpaSup_OS-reconfigs--BiBs+KKs : --------------------------------------
nwsConn1() { p1=${1:?"... <wpa-wlan-filename-to-be-activated->"} ; cat   ${wpaSup_confDP}/${q_Label1qq}0head_wpa1.conf  "$p1"  >|  ${wpaSup_EvvConfFP} &&  systemctl   restart   dhcpcd.service  wpa_supplicant.service && echo "_____NW-restarted_with:  $p1" ; }  ##--NW-Switch-wlan-func1
alias  nwkka3s="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}1kk_SHy_A3S_wpa1.conf"    ##--NW-1kk-Handy-A3S
alias  nwbibas="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}bib_antons_wpa1.conf"     ##--NW-Bib-Anton-Saevkow--bib-gast+PW
alias  nwbibhb="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}bib_HBoell_wpa1.conf"     ##--NW-Bib-Anton-Saevkow--bib-gast+PW
##__ alias  nwbibas="cd /etc/wpa_supplicant/  && cat   ${q_Label1qq}0head_wpa1.conf  ${q_Label1qq}bib_antons_wpa1.conf  >|  ${q_Label1qq}wpa-wlans1.conf"     ##--NW-Bib-Anton-Saevkow--bib-gast+PW

##----- keyboards :
alias  kbd1="rmmod atkbd ; modprobe  atkbd  reset=1" ##--keyboard-problem-xfce4 repeated-keys of itself !!
alias  kbd2="rmmod atkbd ; modprobe  atkbd  reset=1 ; loadkeys   de-latin1" ##--keyboard-problem-xfce4 repeated-keys of itself !!

##----- Apps...:
alias chrom1='chromium   --incognito  > /dev/null  2>&1  &'
alias viv1='vivaldi-stable   --incognito  > /dev/null  2>&1  &'

##----- terminals for xfce4-terminal ,  using  "dbus-run-session  xfce4-terminal" and having per-user-configured-terminals (user-setting wer not accessible/readable) !!:
##--I-  so now using:  dbus-run-session (see man dbus-run-session) :
##  /OR1  su - m1 ; export DISPLAY=":0.0" ;  dbus-run-session -- bash ; #-then:  terms1 ; ... and all further cmds are running connected to the this dbus-daemon and do NOT require any additional call/prefixed of dbus-run-session ! PREFERED but have to keep the caller-terminal open !
##  /OR2  su - m1 ; export DISPLAY=":0.0" ;  dbus-run-session -- xfce4-terminal --disable-server --tab --tab --tab --tab &   ##--any further app-start again require prefixed with new dbus-run-session to connect to its dbus-daemon ! 
##-------- terminals for xfce4-terminal , BEFORE using  "dbus-run-session  xfce4-terminal" and having per-user-configured-terminals (user-setting wer not accessible/readable) !!:
##--OK1:  terms1tabsParams5="--dynamic-title-mode=replace  --color-bg=yellow --color-text=black"
terms1winsParamsAll1="--geometry=150x30  --font=Source\ Code\ Pro\ 9  --hold  --disable-server  --dynamic-title-mode=replace  --active-tab"  ##--is used as Allg, so also for col5/m1 ... !
terms1tabsParams3="--dynamic-title-mode=replace  --color-bg=black  --color-text=white"
terms1tabsParams5="--dynamic-title-mode=replace  --color-bg="#FFDD00" --color-text=black"
alias  terms1col3="xfce4-terminal  $terms1winsParamsAll1  $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3"
alias  terms1col5="xfce4-terminal  $terms1winsParamsAll1  $terms1tabsParams5 --tab $terms1tabsParams5 --tab $terms1tabsParams5 --tab $terms1tabsParams5 --tab $terms1tabsParams5"
##__OK1: alias  terms1col3="xfce4-terminal  --disable-server  --font='Monospace 10' $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3 --tab $terms1tabsParams3"

##______________ 1END_____________________________________________________
q_ple1  "${BASH_SOURCE[0]##*/}"

############################################# prev/coll/arc/tr/tmp/... : #############################################
################## __1END__ ################# prev/coll/arc/tr/tmp/... : #############################################
