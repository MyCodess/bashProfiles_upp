##__  #!/bin/bash
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;
set -a

##------------------!!- shell-std-cmds-re-Forming  --->NOT redefining org-OS-cmds, as ls , grep , ...  !!
alias  grep1='grep  --color=auto'
alias  ls1='ls   -p  --group-directories-first  --time-style=long-iso  --color=never'
alias  ls1c='ls  -p  --group-directories-first  --time-style=long-iso  --color=auto'
alias  cpib='cp  -ixv  --preserve --backup=numbered'    ##- you can force copying then with -f ; tha final/last cmdline-option is in effect from multiple "-n -i -f" , see man-page  !
alias  mv1='mv  -iv   --strip-trailing-slashes'
alias  mvi='mv1'
alias  mvib='mv1  --backup=numbered'  ##- you can force copying then with -f  OR with -n for never-overwriting a file; If you specify more than one of -i, -f, -n, only the final one takes effect. see man-page !
#--vims-basics:
alias  vi1='vim'       ##--REF-for-vim-calls!!
alias  gvi1='gvim'     ##--REF-for-gvim-calls!!
alias  view1='vi1 -R'  ##--REF-for-view-calls!!
alias  vi=vi1
#-vims-calls-basics:
vi_SN1=Vi_1            ##--VIM-ServerName_1
alias visrv1='vi1  --servername $vi_SN1 --remote-tab-silent'
alias visrv1s='vi1  --servername $vi_SN1'   #-for first call with eg a session.vimm,...
vi_SN2=Vi_2            ##--VIM-ServerName_1
alias visrv2='vi1  --servername $vi_SN2 --remote-tab-silent'
alias visrv2s='vi1  --servername $vi_SN2'   #-for first call with eg a session.vimm,...
##-------------------------------------------------------------------------------------------------------


##========== evvs/upps :
alias  plabs='export  -p   | sort  | grep1  -i   q_label'


##========== 'll's aliase MUST be the very firsts! : ======
alias ll='ls1    -l'
alias llc='ls1c  -l'
alias lla='ll    -A'
alias llah='ll   -Ah'
alias llat='ll   -Ah -rt'
alias llh='ll    -h'
alias llt='ll    -rt'
##-- llX-funcIes: ---
alias lld='ll   -Ah  *$($cuds)*'
alias llm='echo  "*[-_.]$(date +%y%m)[0-9][0-9]*"  ;  ll   -Ah  *[-_.]$(date +%y%m)[0-9][0-9]*'


##========== syys/syysTg/-stuf ... ========================================
##---- syysTg-stuff generall-part:
alias  cdrepos1='cd ${syysLocReposDP} && lla && pwd';
alias  cdsyysdnts='cd  $syys_dnts_DP && ls1 -la && pwd ;'
##--- syys-stats, syys-syysTg-tree:
alias vistat1='vi1   ${syysTgStats_dntsFP}'
alias visetup1='vi1  -o  ${syysTgStatsDP}/setup*_dnts.txt'  ##__1org:  alias visetup1='vi1   +  ${syysTgSetupdntsFP}'
alias cdsyystg='cdlla  ${q_syysTgDP}'

##========== OS/XWins/apps/syystem/utils/SWs... misc: =====
##----- dbus/OS1-shorties:
alias dbus1='dbus-launch --exit-with-session'  ##--starting progs as another user in X, eg: for m1 the thunar ...
alias vibm1='vi1 -o  $filesBM1_FP  ${ProgsResW1DP}/${USER}*BMs1*'
#
##========== Terminals /terms1 :
alias  terms1='xfce4-terminal  --disable-server  --tab --tab --tab --tab &';
alias  teterms1='xfce4-terminal  --disable-server  --working-directory=${vaarAuTestsDP}  --tab  --working-directory=${syys_dnts_DP}  --tab --working-directory=${lxOSsdntsDP}  --tab  --working-directory=${syys_wk_DP}  --tab --working-directory=${syysVarDP}  --tab --working-directory=${q_syysTgDP}  --tab  --working-directory=${vaarAuTestsDP}  --tab  --working-directory=${vaarAuTestsDP} &'  ##--prev:-colored-xfce4-terms:  XDG_CONFIG_HOME=~/.config/00xdg2/  
alias  wksterms1='xfce4-terminal  --disable-server --geometry  120x62  --default-working-directory=${vaarAuWorksDP}  --tab  --active-tab  --tab  --tab  --tab  --tab  --tab --working-directory=${q_SW1DocsDP}  --tab --working-directory=${SW1dres1kkDP}  --tab --working-directory=${SW1dntsDP}  &'
alias  mpsterms1='xfce4-terminal  --disable-server  --working-directory=${mpswpDP}  --tab  --working-directory=${mpswpDP}/Listings_Logs_MPs_Curr --tab         --working-directory=${mpsNps1DP}  --tab  --working-directory=${mpsNps1DP}  --tab --working-directory=${mpsG0RTDP}  --tab  --working-directory=${mpsG0RTDP}/dw_MPs  --tab  --working-directory=${mpsG0RTDP}/dw_MPs  --tab  --working-directory=${mpsG0RTDP}/0MPAs_G0s  &'
alias  wpterms1='xfce4-terminal   --working-directory=${q_BinDP}  --tab --working-directory=${wpDP}  --tab --working-directory=${wpDP}/0cu1-wp  --tab --working-directory=${wpDP}/kg1-wp  --tab --working-directory=${absDP}  --tab --working-directory=${tosoDP}  --tab --working-directory=${tosoDP} &'
alias  fmsterms1='cd ${infs1kkDP}/FMs_1kk_Y2022   &&   xfce4-terminal  --disable-server  --working-directory=${tosoDP}  --tab --tab --working-directory=./2207_FMs_1kk/TestingQA_1p_Bewb_1kk-2207  --tab --working-directory=./2207_FMs_1kk  --tab --working-directory=./2207_Kara_Profs &'
alias  cu1terms1='xfce4-terminal  --disable-server  --working-directory=${tosoDP}  --tab  --working-directory=${dntsDP}  --tab --working-directory=${dntsDP}/mswins_dnts/win10s_dnts  &'  ##--win10s-dnts-wk

##---------- vimss/gvims:
alias vifstab='vi1 /etc/fstab'
alias vifstabs='vi1 -o /etc/fstab /etc/mtab'
alias vigrubs='vi1 /boot/grub/grub.cfg'  ##--more grubs-files can be added, eg in /etc/grub.d/
alias vilabs='vi1  -o  $wpDP/1labs*.txt'
alias vitagh='vi1  -o  $wpDP/tagh*.txt'
alias vievvetc='cd  ${q_EttcDP} && vi1 *sh'
alias vihostprofs='vi1  $q_HostGlobProfPosFP  $q_HostGlobProfFP'
alias vigitsdnts='vi1 ${gitsdntsFP}'
alias vividnts='vi1 ${vimsdntsFP}'
alias vimtit1='vi1  -c "set title"  -c "let  &titlestring=\"GV-$(basename $(pwd)) : \" . statuslinestr" '
alias gvimtit1='gvi1  -c "set title"  -c "let  &titlestring=\"GV-$(basename $(pwd)) : \" . statuslinestr" '
alias gvimtit1a='gvimtit1   -g -p'  ##-a==all
alias gvimtit1x='gvimtit1  -g -p ./*.txt'  ##--x==tXt
alias gvimtit1xx='gvimtit1 -g -p  $(ls  *.txt  *.log  *.csv  *.tsv *sh *.out)'  ##--I-if no ls but just eg *.txt, then *.xx will be shown in a tab, if no file there!
alias gvimexp='gvi1  -c ":15Lexplore"'

##========== w1-/w1_m-tree: ===============================
##---------- w1-docsm_1kk :
alias cddevcdocs='cdlla  $devcDocsDP'
##---------- WPads/MEs2:
alias cdwpad='cdlla $wpDP'
alias viwpad='vi1 $wpFP'
alias caps1='cat $caps1FP'
alias caps1g='cat $caps1FP | grepi -i'
alias cdabs='cdlla  $absDP'
alias viabs='vi1  $absFP'
alias cdabs='cdlla  ${absDP}'
##---------- L1NWs/Loc-NWs_1kk/...:
alias cdl1nwstat='cdlla ${l1nwStatsDP}'
alias cdl1nwbupflags='cdlla  ${l1nwBupsLogsFlagsDP}'
##================= __1END__ w1-tree: ---------------------

##========== T1s/T1vars/...: ==============================
alias cddocsvar='cdlla ${docsvarDP}'
##========== MPs/MVPs: ====================================
alias cdmvps='cdlla  ${mvpsDP}'
alias cdvps='cdlla  ${vpsDP}'
alias cdmps='cdlla  ${mpsDP}'
alias cdmps0='cdlla  ${mpsG0RTDP}'
alias cdmps1='cdlla  ${mps1DP}'
alias cdmpsa='cdlla  ${mpsADP}'
alias cdmpswp='cdlla  ${mpswpDP}'
alias cdmpsnps1='cdlla  ${mpsNps1DP}'

##========== cds to: evv/upp/ettcu/vaaru/vaarAu/... : ==================
alias cdupp='cdlla  ${q_UppDP}'
alias cdevv='cdlla  ${q_EvvDP}'
alias cdbin='cdlla  ${q_BinDP}'
alias cdetc='cdlla  ${q_EttcDP}'
alias cdetcd='cdlla  ${q_EttcD_DP}'
alias cdetcuser='cdlla  ${ettcUser}'
alias cdetcau='cdlla  ${ettcAuDP}'
alias cdvaru='cdlla  ${vaaruDP}'
alias cdvarau='cdlla  ${vaarAuDP}'
alias cdvaruser='cdlla  ${vaarUser}'
alias cdnps='cdlla  ${npsDP}'
alias cdnps2='cdlla  ${nps2DP}'
alias cdbupsvar1='cdlla  ${vaarAuBups1DP}'
alias cd2so='cdlla  ${tosoDP}'
alias cdsyyscd='cdlla  ${syysCDDP}'
alias cdstat1='cdlla  ${syysTgStatsDP}'
alias cdte='cdlla  ${vaarAuTestsDP}'
alias cdwks='cdlla  ${vaarAuWorksDP}'
alias cdtr='cdlla  $trDP'
##----------END-cds------------------------------

##========== devels/ITs/SWs/... : =========================
#--
alias cdlxossdnts='cdlla  ${lxOSsdntsDP}'
#--dres/dnts:
alias cddnts='cdlla  ${dntsDP}'
alias cddres='cdlla  ${dresDP}'
alias cddrescodecs='cdlla  ${dresCodecsDP}'
#--mssdnts:
alias  cdmsdnts='cdlla ${mssdntsDP}/'
alias  cdmsdntsshells='cdlla ${mssshellsdntsDP}/'

##========== rest-all : ===================================
alias ..='cdlla  ..'
alias a='alias'
alias afg='(alias && declare -pF)  | grep1  -i'  # igrep1  in aliases-Names+Definitions and in funcs-Names
alias afgn='(alias && declare -pF) | sed -e  "s/=.*//"  | grep1  -i'  # igrep1  only-in-NAMES of  aliases + funcNames
# alias bashu='bash --rcfile $evvEnvFP' ; alias bashnorcs='bash --noprofile  --norc'
alias cptafat='cp -ix -a --no-preserve=ownership'   ##-for FATs, or if uid/gid irrelevant!
alias cptr='cp -ix   -Rd --preserve=timestamp'     ##-as -a but only timestamp relevant, rest egal! eg for FATs and more ...
alias cpt='cp  -ixv  -d --preserve=timestamp'      ##-only time relevant
alias df.='df -h .'
alias dusk='du -x -sk * | sort -n ; du -x -sk  .'     ##-if shell-glob-option not set fo ..-dirs: 'du -sk * .[[:alnum:]]* | sort -n'
alias dusm='du -x -sm * | sort -n ; du -x -sm  .'     ##-if shell-glob-option not set fo ..-dirs: 'du -sm * .[[:alnum:]]* | sort -n'
alias dusg='du -x -s --block-size=1G  * | sort -n ; du -x -s --block-size=1G .'  #-i- if shell-glob-option not set fo ..-dirs: 'du -sm * .[[:alnum:]]* | sort -n'
alias ep='echo $PATH'
alias eplines='echo -e ${PATH//:/"\n"}'             ##--PATH as lines
##__ alias epl='echo $PATH | tr ':' "[\n]" | sort '    ##- PATH as lines if "echo -e" not working...
alias envg='(alias ; declare -p ) | grep1  -i'   # grep1  a name in all env, also in EVERYTHING: loc.variables+exports+funcs+funcs.defs+aliases+...  (except pathes which is done by which/type).
alias expg='export -p   | sort  | grep1  -i'                      ##--prev:- 'export -p | sed  -e 's/  */\t/g' | sort | grep1  -i'   # only global vars  ##--offc-
alias expgn='export -p  | sed -e 's:=.*::' | sort | grep1  -i '   ##--prev:-   "export -p  | sed -e 's/=.*//' -e 's/  */\t/g' | sort | grep1  -i "  ##--??- ?replace in bash??: alias expgn='typeset +x | grep1  -i'  ##--offc-
alias findinNotEvvNamings='find .  -depth  -regextype posix-extended    -regex  ".*[^[:alnum:]/_.-].*"  '  ##--find not-evvConform-Filenames
alias grepi='grep1  -i'
alias hs='history'
alias hsg='fc -l -10000 | grep1  -i' #--i- not with history, so without timestamp, if activated.
alias hsrma='rm -iv $histfilePrev $HISTFILE $HOME/.*hist*  $HOME/.hs_* ; unset HISTFILE' ##--U-: -v -history-rm-...
alias hsnofile='unset HISTFILE'  #--I-notsaving--but-do-hss-in-cu-shell!
alias hsnono='unset HISTFILE; set +o history'  #--I-not-hss-at-all-in-cu-shell!
alias infovi='info --vi-keys'
alias lsblk1='lsblk  -p  -f  -o  +SIZE,TYPE'
alias lsblk2='lsblk  -p  -f  -o  +PATH,SIZE,TYPE,FSSIZE,PARTLABEL,PARTTYPE,NAME,PTTYPE,MODEL,LABEL,PARTUUID'
alias mountg='mount -vl | sort | grep1  -i'
alias mmed1='mount -vl ${q_Med1DP}'  ##--I- also ok:  mount -L MED1  ;but LABEL is no parameter for umount !!
alias ummed1='umount ${q_Med1DP}'
alias cdmed1='cdlla  ${q_Med1DP}'
alias mbups1locmed1='mount -vl ${q_Bups1LocMed1RTDP} && cdlla ${vaarAuBups1DP}'
alias umbups1locmed1='cd; sync; sync; sync; umount -v ${q_Bups1LocMed1RTDP}'
alias mbups1med1='mount -vl ${q_Bups1Med1DP} && cdlla ${q_Bups1Med1DP}'
alias umbups1med1='cd; sync; sync; sync; umount -v ${q_Bups1Med1DP}'
alias cdbups1med1='cdlla  ${q_Bups1Med1DP}'
alias mmpsmed1='mount -vl ${mpsMed1DP}'
alias ummpsmed1='umount ${mpsMed1DP}'
alias cdmpsmed1='cdlla  ${mpsMed1DP}'
##__  alias mv2sofromhome='mv -iv   ~/PDF/*    ~/Downloads/*    ~/Documents/*   ${tosoDP}/'
alias mvfrom2sohere='mv -iv   ${tosoDP}/*  ./ '
alias pcuds1='echo; echo ===== cuds1:  $($cuds) , $($cuds)- , $($cudts) === yest:  $($cuds --date="-1 day") , $($cuds --date="-1 day")-  =====; echo;'   ##--print-cuds-all-1
alias pingchecks1='el1d; for ii in  8.8.8.8  www.google.de  pop.mail.yahoo.de  pop3.strato.de ;do echo "=========== $ii :" ; ping -c 3  $ii ; echo;el1 ; done'   ##-- 8.8.8.8  is a Google DNS server 
alias promptlong="PS1='\u@\h:\w >'"
alias promptshort="PS1='\W : '"  ##--OK1-incl-user@host:  alias promptshort="PS1='\u@\h:\W >'"
alias psg='ps -AFcjwwww |  grep1  -v  grep  |  grep -E  --color=auto  -e PPID  -ie'
alias psu='ps -f -u $q_LOGNAME'
alias psug='ps -f -u $q_LOGNAME | grep1  -v grep1  | grep1  -i'
alias rsync-fat-do='rsync    -v -rtlHO --modify-window=5  --delete '
alias rsync-fat-n='rsync -n  -v -rtlHO --modify-window=5  --delete '
alias setg="declare -p | sed  -e 's/  */\t/g' | sort  | grep1  -i"    # all vars 
##__ ok1--evvunset='u_vars11=$(export -p  | grep -F  " q_" | sed -e "s:.* \([^=]*\)=.*:\1:"); unset $u_vars11'
##__ ok2--evvunset='ue_vars11=$(export -p  | grep -F  " q_" | sed -e "s:.* q_:q_:"  -e "s:=.*::" ); unset $ue_vars11' ##--I-extra NOT evv_vars11 , due to recursive naming here! OK!
alias unsus1='unset ${!q_@}  ${!syys@}'   ##--unset all vars starting with evv ! see man bash : ${!prefix@} ; for evv basically should take only q_ vars! but just to get sure ...! sauberer you delete syys one !
alias sus1='source  $q_ProfileFP ;'
alias sus1unset='v11=${q_ProfileFP} ; unset ${!q_@}  ${!syys@} ; source ${v11}'
alias 3sync='sync;sync;sync'
alias 3cl='clear;clear;clear'

##========================================================
q_ple1  "${BASH_SOURCE[0]##*/}"

