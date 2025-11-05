##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"
set -a
#################### here only tr/cu1/testies/checkies/to.see/tr-tasks/... : NON-persistents ...! ############

##========== 2chk/wk-cu:
##__  TIME_STYLE=posix-long-iso


#####  ==========  NWs_Wlans_wpaSup_OS ::
#_______:  NWs_Wlans_wpaSup_OS ::
wpaSup_confDP="/etc/wpa_supplicant"
wpaSup_EvvConfFN="${q_Label1qq}wpa-wlans1.conf"
wpaSup_EvvConfFP="${wpaSup_confDP}/${wpaSup_EvvConfFN}"
##--
alias cdnwwpaSup="cdlla  ${wpaSup_confDP}"
alias vinw-wpaSup="sudo vi -o   ${wpaSup_confDP}/*";
alias os1nwrestart="sudo  systemctl   restart   dhcpcd.service  wpa_supplicant.service"
##__ NWMgr-restart-old1:  alias os1nwrestart="sudo  /bin/systemctl stop network-manager.service;  sudo  /bin/systemctl start network-manager.service;"  ##--!!-do-NOT use restart!! see man systemctl !  --old-initV-but-ok:  sudo  service  network-manager  --full-restart ;

#_______:  NWs_Wlans_wpaSup-profiles/-reconfigs--BiBs+KKs ::
nwsConn1() { p1=${1:?"... <wpa-wlan-filename-to-be-activated->"} ; cat   ${wpaSup_confDP}/${q_Label1qq}0head_wpa1.conf  "$p1"  >|  ${wpaSup_EvvConfFP} &&  systemctl   restart   dhcpcd.service  wpa_supplicant.service && echo "_____NW-restarted_with:  $p1" ; }  ##--NW-Switch-wlan-func1
alias  nwkka3s="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}1kk_SHy_A3S_wpa1.conf"    ##--NW-1kk-Handy-A3S
alias  nwbibas="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}bib_antons_wpa1.conf"     ##--NW-Bib-Anton-Saevkow
alias  nwbibhb="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}bib_HBoell_wpa1.conf"     ##--NW-Bib-HeinrichBoell   :requires-confirms!
alias  nwbibws="nwsConn1  ${wpaSup_confDP}/${q_Label1qq}bib_WSchnurr_wpa1.conf"   ##--NW-Bib-WolfgangSchnurr :requires-confirms!
##__ alias  nwbibas="cd /etc/wpa_supplicant/  && cat   ${q_Label1qq}0head_wpa1.conf  ${q_Label1qq}bib_antons_wpa1.conf  >|  ${q_Label1qq}wpa-wlans1.conf"     ##--NW-Bib-Anton-Saevkow--bib-gast+PW
##________________________________________  ___________________________


#####  ==========  terminals-cu:
##----- terminals for xfce4-terminal ,  using  "dbus-run-session  xfce4-terminal" and having per-user-configured-terminals (user-setting wer not accessible/readable) !!:
##--I-  so now using:  dbus-run-session (see man dbus-run-session) :
##  /OR1  su - m1 ; export DISPLAY=":0.0" ;  dbus-run-session -- bash ; #-then:  te1 ; ... and all further cmds are running connected to the this dbus-daemon and do NOT require any additional call/prefixed of dbus-run-session ! PREFERED but have to keep the caller-terminal open !
##  /OR2  su - m1 ; export DISPLAY=":0.0" ;  dbus-run-session -- xfce4-terminal --disable-server --tab --tab --tab --tab &   ##--any further app-start again require prefixed with new dbus-run-session to connect to its dbus-daemon ! 
##-------- terminals for xfce4-terminal , BEFORE using  "dbus-run-session  xfce4-terminal" and having per-user-configured-terminals (user-setting wer not accessible/readable) !!:
##--OK1:  te1tabsParams5="--dynamic-title-mode=replace  --color-bg=yellow --color-text=black"
te1winsParamsAll1="--geometry=150x30  --font=Source\ Code\ Pro\ 9  --hold  --disable-server  --dynamic-title-mode=replace  --active-tab"  ##--is used as Allg, so also for col5/m1 ... !
te1tabsParams3="--dynamic-title-mode=replace  --color-bg=black  --color-text=white"
te1tabsParams5="--dynamic-title-mode=replace  --color-bg="#FFDD00" --color-text=black"
alias  te1col3="xfce4-terminal  $te1winsParamsAll1  $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3"
alias  te1col5="xfce4-terminal  $te1winsParamsAll1  $te1tabsParams5 --tab $te1tabsParams5 --tab $te1tabsParams5 --tab $te1tabsParams5 --tab $te1tabsParams5"
alias  te1fms='cd ${infs1kkDP}/FMs_1kk_Y2022   &&   xfce4-terminal  --disable-server  --working-directory=${tosoDP}  --tab --tab --working-directory=./2207_FMs_1kk/TestingQA_1p_Bewb_1kk-2207  --tab --working-directory=./2207_FMs_1kk  --tab --working-directory=./2207_Kara_Profs &'
alias  te1cu1='xfce4-terminal  --disable-server  --working-directory=${tosoDP}  --tab  --working-directory=${dntsDP}  --tab --working-directory=${dntsDP}/mswins_dnts/win10s_dnts  &'  ##--win10s-dnts-wk
##__OK1: alias  te1col3="xfce4-terminal  --disable-server  --font='Monospace 10' $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3 --tab $te1tabsParams3"
##________________________________________  ___________________________


#####  ==========  task1 (sub-prj/topic-cu-wk/thema-cu/devl-cu-topic/...:
tsk1name=docks1
tsk1dirs="${vaarAuWorksDP}/${tsk1name}/  ${dntsDP}/devops-buildConfMgm_dnts/  ${vaarAuDP}/${tsk1name}_var/"
te1tsk1(){ cmdstr1=""; for ii in ${tsk1dirs}; do cmdstr1="${cmdstr1}  --tab  --working-directory=${ii}"; done; cmdstr1="xfce4-terminal  --disable-server --working-directory=${tosoDP}  ${cmdstr1}"; $cmdstr1 & }
##________________________________________  ___________________________


#####  ==========  miscs-cu:
alias  cdnpshdd="cdlla  ${q_Bups1LocMed1RTDP}/T1_Loc/nps"
##----- keyboards :
alias  kbd1="rmmod atkbd ; modprobe  atkbd  reset=1" ##--keyboard-problem-xfce4 repeated-keys of itself !!
alias  kbd2="rmmod atkbd ; modprobe  atkbd  reset=1 ; loadkeys   de-latin1" ##--keyboard-problem-xfce4 repeated-keys of itself !!
##________________________________________  ___________________________


##______________ 1END_____________________________________________________
q_ple1  "${BASH_SOURCE[0]##*/}"

############################################# prev/coll/arc/tr/tmp/... : #############################################
################## __1END__ ################# prev/coll/arc/tr/tmp/... : #############################################
