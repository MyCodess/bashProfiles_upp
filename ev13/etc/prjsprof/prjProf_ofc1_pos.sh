set -a
q_pls1  "${BASH_SOURCE[0]##*/}"

#
#####  ==========  PRJ-specifics-apps-VARs/aliases/funcs/addies (not in prj0-files):
#	_______:  djangoPrj:
##__  export  q_djangoSettingsDev="netservices.settings.dev"
##__  export  DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-netservices.settings.dev}   ##--as default
alias  setdjsettingdev="export DJANGO_SETTINGS_MODULE=netservices.settings.dev"
alias  setdjsettingtest="export DJANGO_SETTINGS_MODULE=netservices.settings.test"
alias  setdjsettingsrv="export DJANGO_SETTINGS_MODULE=netservices.settings.server"
alias  setpypath1='export PYTHONPATH="${q_prjCodeDjix1DP}/:${q_prjCodeDjix1DP}/lib/:${q_prjCodeDjix1DP}/netservices/" ; echo "PYTHONPATH set to: $PYTHONPATH"'
###________________________________________  ___________________________


#####  ==========  terms1s with wt /prj: ==========================================
##--- basics-terms1s:
#--II- MSYS2-abbrev-evv == "mys"  , wt-profile: "myst1" , wt-start-cmd:  C:\msys64\msys2_shell.cmd  -defterm  -here  -no-start  -ucrt64
te11_myswt() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title]   ##--starts a MSYS2-bash-shell in wt-term and cd to start-DIR" ;
	local tit11="${2:-$wt_tit11}" ; wt -w "$tit11" nt -p myst1 --title "$tit11" -d "${1:?$usage11}" ;}

#----- terms1-VARs:
q_prjCode2DN="cod2"     ; q_prjCode2DP="${q_prjCode1DP}/${q_prjCode2DN}//netservices" ; q_prjCode2Title=P_${q_prjCode2DN} ;
q_prjCode3DN="djix1"    ; q_prjCode3DP="${q_prjCode1DP}/${q_prjCode3DN}/netservices"  ; q_prjCode3Title=P_${q_prjCode3DN} ; q_prjCodeDjix1DP="${q_prjCode3DP}"
q_prjCode4DN="lint1"    ; q_prjCode4DP="${q_prjCode1DP}/${q_prjCode4DN}/netservices"  ; q_prjCode4Title=P_${q_prjCode4DN} ;
q_prjCodeWk1DN="works1" ; q_prjCodeWk1DP="${q_prjCode1DP}/${q_prjCodeWk1DN}"    ; q_prjCodeWk1Title=P_${q_prjCodeWk1DN} ;
##__/OR: works in codX-dir:  q_prjCodeWk1DN="works1" ; q_prjCodeWk1DP="${q_prjCode3DP}/tests/${q_prjCodeWk1DN}"    ; q_prjCodeWk1Title=P_${q_prjCodeWk1DN} ;

#---prjsCodes-aliases:
alias  cdprjcode2='cdlla   ${q_prjCode2DP}' ; alias  cdprjcodeck1=cdprjcode2   ;
alias  cdprjcode3='cdlla   ${q_prjCode3DP}' ; alias  cdprjcodedjix1='cdlla   ${q_prjCodeDjix1DP}'
alias  cdprjcode4='cdlla   ${q_prjCode4DP}' ; alias  cdprjcodelint1=cdprjcode4 ;
alias  cdprjcodewk1='cdlla   ${q_prjCodeWk1DP}'

#---prjcodes-DIRs-for-terms1:
dresdir11="${dresDP}/  ${dntsDP}/  ${mssdntsDP}  ${q_SW1dntsDP}/  ${q_SW1dres1kkDP}/"  ##--more: ${dresCodecsDP}/  
#__OK1_full:  prjntsdir11="${q_prjDP}/  ${q_prjBinDP}/  ${q_prjEtcDP}/  ${q_prjDntsDP}/  ${q_prjWpadsDP}/  ${q_BinDP}/  ${q_EttcDP}/  ${q_prjsProfDP}/"  ##--prj-dnts-wpad-terms + evv
prjntsdir11="${q_prjDP}/  ${q_prjDntsDP}/  ${q_prjDntsDP}/  ${q_prjCode1DP}/  ${q_EttcDP}/  ${q_EttcDP}/"  ##--prj-dnts-wpad-terms + evv
prjcode2dir11="${q_prjCode2DP}/  ${q_prjCode2DP}/  ${q_prjCode2DP}/"
prjcode3dir11="${q_prjCode3DP}/  ${q_prjCode3DP}/  ${q_prjCode3DP}/  ${q_prjCode3DP}/  ${q_prjCode3DP}/"
prjcode4dir11="${q_prjCode4DP}/  ${q_prjCode4DP}/  ${q_prjCode4DP}/"
prjcodewk1dir11="${q_prjCodeWk1DP}/  ${q_prjCodeWk1DP}/  ${q_prjCodeWk1DP}/"
wksdirs11="${vaarAuTestsDP}/  ${vaarAuWorksDP}/  ${q_prjWksDP}/  ${q_prjCodeWk1DP}/  ${q_prjCodeWk1DP}/"

#---call-terms1-prjcodes, ....:
te1_dres()      { for ii in $dresdir11; do te11_myswt $ii dres_t1; done ; }
te1_prjnts()    { for ii in $prjntsdir11; do te11_myswt $ii P_Nts; done ; }
te1_prjcode2()  { for ii in $prjcode2dir11; do te11_myswt   $ii $q_prjCode2Title ; done ; }
te1_prjcode3()  { for ii in $prjcode3dir11; do te11_myswt   $ii $q_prjCode3Title ; done ; } ; alias te1_prjcodedjix1=te1_prjcode3
te1_prjcode4()  { for ii in $prjcode4dir11; do te11_myswt   $ii $q_prjCode4Title ; done ; }
te1_prjcodewk1() { for ii in $prjcodewk1dir11; do te11_myswt  $ii $q_prjCodeWk1Title ; done ; }
te1_wks()       { for ii in $wksdirs11;  do te11_myswt $ii wks_t1; done ; }

#---cu-/tmp-terms:
te1_pysrc() { cdpydocs ; for ii in  .   ./PyRefsSrc/   ./PyRefsSrc/Doc ./PyRefsSrc/Doc  ./PyRefsSrc/Doc   ;do te11_myswt $ii pySrc ; done }
te1_sqls() { for ii in ${dntsDP}/dbs-sqls_dnts/mysqls_mariadb_dnts  ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${q_prjDntsDP}/mysqls_cons1_dnts ; do te11_myswt $ii sqls_t1 ; done }
###________________________________________  ___________________________



q_ple1  "${BASH_SOURCE[0]##*/}"
##################################################################################################



: <<'COMMENTS11'
############################## 1OKs_prevs ...: ###################################################
#####  ==========  1OKs_prevs...:
##--- vims:
alias  vimm='/c/Progs2/Vim/vim90/vim.exe      -u "C:\Users\DKX8H1N\ofc1\etc\vimrc"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
alias  gvimm='/c/Progs2/Vim/vim90/gvim.exe    -u "C:\Users\DKX8H1N\ofc1\etc\vimrc"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
##---
#
##--- Py/SW1 :
##--1OK-in-ofc1-mswin:  : ${PYTHONPYCACHEPREFIX:="${q_prjVarDP}/0pycs/"}   ##--II- woks?? as target-dir for ALL pyc-files instead local-source-dir! same as -X -X pycache_prefix=PATH: ... BUT NOT-documented in man python !! works??
##__  : ${PYTHONPATH:=":.:${q_prjLibsDP}:"}   ##--II-!! if needed unset/change/...
##__  : ${PYTHONSTARTUP:="${q_prjSTARTUP}"}   ##--I-for py-interactiv-shell like .profile-for-bash
##__    NO-pyc-files-generation-at-all :  : ${PYTHONDONTWRITEBYTECODE:="NoPycache"}   ##--I-for dev ok, but now for frameworks as django,... better generating pyc-files ! also ok for py-interactiv-shell ...


##========== terms1-MS-wt for cyg/git/ps-shells mainly before MSys2 :
#-- basic-funcs to call wt/windows-terminal-profiles for MSYS2/git-bash/cygwin :
wt_DP="/c/Progs2/0ptb/wt" ; wtw_DP="C:\Progs2\0ptb\wt" ; wt_FP="/c/Progs2/0ptb/wt/wt.exe" ; wtw_FP="C:\Progs2\0ptb\wt\wt.exe"
pathaddend "${wt_DP}/"
wt_tit11=wt-1  ##--I-dummy-setting which should be reset to appropriate wt-winID by calling of gitwt11 bzw. cygwt11 !
msywt11() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title] #-starts a git-bash-in-wt-term and cd to start-DIR" ;
	wt -w ${2:-$wt_tit11} nt -p msyt1 --title ${2:-$wt_tit11} -d "${1:?$usage11}" ;}
gitwt11() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title] #-starts a git-bash-in-wt-term and cd to start-DIR" ;
	cd "${1:?$usage11}";  wt -w ${2:-$wt_tit11} nt -p gitt1 --title ${2:-$wt_tit11} -d . ;}
cygwt11() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title]  #-starts a cyg-bash-in-wt-term and cd to start-DIR" 
	cd "${1:?$usage11}";  wt -w ${2:-$wt_tit11} nt --title ${2:-$wt_tit11}  -p cygt1   "C:\cyg\bin\bash.exe"  --noprofile  --norc  -il -c "cd ${1} \; exec bash" ;}
#-- terminals:
wkswt1() { ##--wks-/tests-wt-terms
	wt_tit11=Wks-T ; usage11="USAGE: ... [c/g] #-starts git/cyg-bash-wt-terms; default is c/cyg-bash" ;
	cmd11=msywt11 ;  [[ $1 == "g" ]] && cmd11=gitwt11 ;  [[ $1 == "c" ]] && cmd11=cygwt11 ;
	$cmd11  ${vaarAuTestsDP}/ ; $cmd11  ${vaarAuWorksDP}/ ; $cmd11  ${q_prjWksDP}/ ; $cmd11  ${q_prjCode2DP}/tests/work1/ ; }
dreswt1() { ##--dres-dntss-wt-terms
	wt_tit11=dres-T ; usage11="USAGE: ... [c/g] #-starts git/cyg-bash-wt-terms; default is c/cyg-bash" ;
	cmd11=cygwt11 ;  [[ $1 == "g" ]] && cmd11=gitwt11 ;
	$cmd11  ${dresDP}/ ; $cmd11  ${dntsDP}/  ; $cmd11  ${dresCodecsDP}/ ; $cmd11  ${q_SW1dntsDP} ; $cmd11  ${q_SW1dntsDP} ; $cmd11  ${q_SW1dres1kkDP} ; $cmd11  ${q_SW1dres1kkDP} ; }
pntswt1() { ##--prj-dnts-wt-terms
	wt_tit11=Pwpd-T ; usage11="USAGE: ... [c/g] #-starts git/cyg-bash-wt-terms; default is c/cyg-bash" ;
	cmd11=cygwt11 ;  [[ $1 == "g" ]] && cmd11=gitwt11 ;
	$cmd11  ${q_prjDP}/ ; $cmd11  ${q_prjBinDP}/  ; $cmd11  ${q_prjEtcDP}/ ; $cmd11  ${q_prjDntsDP}/ ;  $cmd11  ${q_prjWpadsDP}/ ; $cmd11  ${q_BinDP}/ ; $cmd11  ${q_EttcDP}/ ; }
pcodeswt1() { ##--prj-codes-wt-terms  ---> dfault is g/git-bash:
	wt_tit11=PCodes-T ; usage11="USAGE: ... [c/g] #-starts git/cyg-bash-wt-terms; default is c/cyg-bash" ;
	cmd11=gitwt11 ;  [[ $1 == "c" ]] && cmd11=gitwt11 ;
	$cmd11  ${q_prjCode2DP}/ ; $cmd11  ${q_prjCode2DP}/  ; $cmd11  ${q_prjCode2DP}/ ; }
###________________________________________  ___________________________


############################## olds/prev/hists/colls/....: #######################################
#####  ==========  olds/prev/hists/...
##--- pls1/ple1 prev with counter:
#--1org_was?? myname.settings: export myname_org_cu="${BASH_SOURCE[0]##*/}" ; myname_cu=${myname_org_cu//./_} ; declare -xi ${myname_cu}=${!myname_cu:-0}  ##- int-counter ; q_pls1  "${myname_org_cu}"
#--1org_was??:   mynames-cu-final: ; (( ${myname_cu}+=1 )) ; q_ple1  "${myname_org_cu} : ${!myname_cu}"
###________________________________________  ___________________________
COMMENTS11

