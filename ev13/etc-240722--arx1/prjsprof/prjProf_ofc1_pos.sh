set -a
q_pls1  "${BASH_SOURCE[0]##*/}"
##--I-: abbrev-/evv-Label1 in mswins-prj-ofc1 for VAR-names:  q_pyy ==python-stuff (_CP:  mss ==mswins/mssehlls-allg see mswin-prof)

#####  ==========  pathes-addies-prj1/OS1 , SWs/Py/wt/...-installed-on-OS-mswin--integrate them here into PATH,...:
progs2_DP="/c/Progs2"
ptb0_DP="${progs2_DP}/0ptb"
q_pyyHome1_DP=${progs2_DP}/Py3 ; q_pyyHome1Scripts_DP=${q_pyyHome1_DP}/Scripts ; q_pyyexe="${q_pyyHome1_DP}/python.exe"   ##--py--mswin-installed-in-lxpath-format
wt_DP="${ptb0_DP}/wt" ; wt_FP="${wt_DP}/wt.exe"
git1_DP="${ptb0_DP}/git1ptb" ; git1cmd_DP="${git1_DP}/cmd" ; 
##-- path-addies:
pathaddvor "${q_pyyHome1_DP}/" ; pathaddvor "${q_pyyHome1Scripts_DP}/" ;
pathaddend "${git1cmd_DP}/"
pathaddend "${wt_DP}/"
pathaddend "${ptb0_DP}/Graphviz/bin"
##--- progs/apps/...:
alias  vscode1="${progs2_DP}/VSCode/Code.exe  .  &"
###________________________________________  ___________________________


#####  ==========  SW1/main-SW/installed-Package-/App-Refs: install.setup,rpms....of the APP : here PYTHON ####################
##-----
q_SW1Version='3.11'           ##-- current-rpm-version of setup
q_SW1SetupRTDP="/usr/lib"
q_SW1NameVer="${q_SW1Name}${q_SW1Version}"
q_SW1Libs1DN="${q_SW1NameVer}"
q_SW1Libs1DP="${q_SW1SetupRTDP}/${q_SW1Libs1DN}"

##----- more specific-pkg/docs/dirs.... SW1 :
q_SW1RefdocsvarDP="${q_SW1DocsvarDP}/0-RefDocsVar_py/"  ##--RefDocs unpacked,unzipped,.... in docsvar-dir !
q_SW1RefdocsvarTxtDP="${q_SW1RefdocsvarDP}/docs-text/"   ##--I-for greps ...!
###________________________________________  ___________________________


#####  ==========  SWs-specifics-VARs/aliases/funcs/addies (not in prj0-files):
##----- SWs/Pys/...-settings-configs:
PYTHONPYCACHEPREFIX="${q_prjVarDP}/0pycs/"   ##--II- woks?? as target-dir for ALL pyc-files instead local-source-dir! same as -X -X pycache_prefix=PATH: ... BUT NOT-documented in man python !! works??
q_prjSTARTUP=${q_prjEtcDP}/pystartup1.py  ##--python-startup-script

##----- funcs-prj-specifics / py: 
##----- aliases-prj-specifics / py:
#-q_pyy-/pythons-aliases:
alias  pydoc1="PAGER=less  $q_pyyexe  -m pydoc"
alias  pypath='echo "PYTHONPATH  is:  ${PYTHONPATH}" ; echo "---PYTHONPATH-lines (ignore emptylines):" ; echo -e ${PYTHONPATH//:/"\n"}'  ##--search-pathes for modules/packages/...; the beginning-and-ending/redundant ":" can be also deleted with: echo -e "${PYTHONPATH/#:/}"  bzw. echo -e "${PYTHONPATH/%:/}" , but so ok! ignore the emptylines !
alias  pysyspath='python -c "import sys; [print(ii) for ii in  sys.path ];"'
alias  pydoc_dj='DJANGO_SETTINGS_MODULE=django.conf.global_settings  python  -c "import django, pydoc ; django.setup() ; pydoc.cli()"'  ##--django-pydoc-call
#-OSs-aliases:
unalias psg ; alias psg="ps | grepi" ; alias psgw="ps -W | grepi";
###________________________________________  ___________________________


#####  ==========  PRJ-specifics-VARs/aliases/funcs/addies (not in prj0-files):
##__  export  q_djangoSettingsDev="netservices.settings.dev"
export  DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-netservices.settings.dev}   ##--as default
alias  setdjsettingdev="export DJANGO_SETTINGS_MODULE=netservices.settings.dev"
alias  setdjsettingtest="export DJANGO_SETTINGS_MODULE=netservices.settings.test"
alias  setdjsettingsrv="export DJANGO_SETTINGS_MODULE=netservices.settings.server"
###________________________________________  ___________________________


#####  ==========  terms1s with wt: ==========================================
##--- basics-terms1s:
#--II- MSYS2-abbrev-evv == "mys"  , wt-profile: "myst1" , wt-start-cmd:  C:\msys64\msys2_shell.cmd  -defterm  -here  -no-start  -ucrt64
te11_myswt() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title]   ##--starts a MSYS2-bash-shell in wt-term and cd to start-DIR" ;
	local tit11="${2:-$wt_tit11}" ; wt -w "$tit11" nt -p myst1 --title "$tit11" -d "${1:?$usage11}" ;}

#----- terms1-VARs:
q_prjCode2DP="${q_prjCode1DP}/ixlib1//netservices" ; q_prjCode2Title=Pixlib1 ;
q_prjCode3DP="${q_prjCode1DP}/djix1//netservices"  ; q_prjCode3Title=Pdjix1  ;
q_prjCode4DP="${q_prjCode1DP}/plin1//netservices"  ; q_prjCode4Title=Pplin1  ;
q_prjcodewk1="${q_prjCode1DP}/works1/"             ; q_prjcodewkTitle=Pwk1   ;

#---prjsCodes-aliases:
alias  cdprjcode2='cdlla   ${q_prjCode2DP}'
alias  cdprjcode3='cdlla   ${q_prjCode3DP}'
alias  cdprjcode4='cdlla   ${q_prjCode4DP}'
alias  cdprjcodewk1='cdlla   ${q_prjcodewk1}'

#---prjcodes-DIRs-for-terms1:
dresdir11="${dresDP}/  ${dntsDP}/  ${mssdntsDP}  ${q_SW1dntsDP}/  ${q_SW1dres1kkDP}/"  ##--more: ${dresCodecsDP}/  
prjntsdir11="${q_prjDP}/  ${q_prjBinDP}/  ${q_prjEtcDP}/  ${q_prjDntsDP}/  ${q_prjWpadsDP}/  ${q_BinDP}/  ${q_EttcDP}/  ${q_prjsProfDP}/"  ##--prj-dnts-wpad-terms + evv
prjcode2dir11="${q_prjCode2DP}/  ${q_prjCode2DP}/  ${q_prjCode2DP}/"
prjcode3dir11="${q_prjCode3DP}/  ${q_prjCode3DP}/  ${q_prjCode3DP}/"
prjcode4dir11="${q_prjCode4DP}/  ${q_prjCode4DP}/  ${q_prjCode4DP}/"
prjcodewkdir11="${q_prjcodewk1}/  ${q_prjcodewk1}/  ${q_prjcodewk1}/"
wkdirs11="${vaarAuTestsDP}/  ${vaarAuWorksDP}/  ${q_prjWksDP}/  ${q_prjcodewk1}/  ${q_prjcodewk1}/"

#---call-terms1-prjcodes, ....:
te1_dres()      { for ii in $dresdir11; do te11_myswt $ii dres_t1; done ; }
te1_prjnts()    { for ii in $prjntsdir11; do te11_myswt $ii PrjNts; done ; }
te1_prjcode2()  { for ii in $prjcode2dir11; do te11_myswt   $ii $q_prjCode2Title ; done ; }
te1_prjcode3()  { for ii in $prjcode3dir11; do te11_myswt   $ii $q_prjCode3Title ; done ; }
te1_prjcode4()  { for ii in $prjcode4dir11; do te11_myswt   $ii $q_prjCode4Title ; done ; }
te1_prjcodewk() { for ii in $prjcodewkdir11; do te11_myswt  $ii $q_prjcodewkTitle ; done ; }
te1_wks()       { for ii in $wkdirs11;  do te11_myswt $ii wks_t1; done ; }
#-tmp-cu-terms:
te1pysrc() { cdpydocs ; for ii in  .   ./PyRefsSrc/   ./PyRefsSrc/Doc ./PyRefsSrc/Doc  ./PyRefsSrc/Doc   ;do te11_myswt $ii pySrc ; done }
alias  te1_prjcodeix=te1_prjcode2    cdprjcodeix=cdprjcode2
alias  te1_prjcodedj=te1_prjcode3    cdprjcodedj=cdprjcode3
alias  te1cu1="te1_wks ; te1_dres ; te1_prjetc ; te1_prjix ;"
###________________________________________  ___________________________


#####  ==========  NWs-PCs-Servers-Infrastruc...-prj:
##-- proxys-settings without "http:..." ; eg: MSYS2 itself, pacman or python .. in msys2 do NOT work if http://.... format !
export q_ofc1_proxy1='zscaler-prod.fs01.vwf.vwfs-ad:8080'
alias  curl1="curl  -x $q_ofc1_proxy1"
setProxysOfc1() { 
	##--II-  echo "setting-Int-Proxys, BUT: not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!"
	##--1OK-for-mswins:  export  HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; export  HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ;
	export  https_proxy="${q_ofc1_proxy1}" ; export  http_proxy="${https_proxy}"
	export  no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,10.34.169.194/8
	export  HTTPS_PROXY="$https_proxy"  HTTP_PROXY="$http_proxy"  NO_PROXY="$no_proxy"
	expg    prox ;  ##--echo $https_proxy  $http_proxy
}  ##--2do--not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!

##-- the same as above,  butt with HTTP://.../ protocol format ! (some apps require this, so incl. http[s]:// ... :)
setProxysOfc1Http() { 
	##--II-  echo "setting-Int-Proxys, BUT: not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!"
	##--1OK-for-mswins:  export  HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; export  HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ;
	##--1OK_b: export  https_proxy='https://zscaler-prod.fs01.vwf.vwfs-ad:8080/' ; export  http_proxy='http://zscaler-prod.fs01.vwf.vwfs-ad:8080/' ;
	export  https_proxy="https://${q_ofc1_proxy1}/" ; export  http_proxy="http://${q_ofc1_proxy1}/"
	export  no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,10.34.169.194/8
	export  HTTPS_PROXY="$https_proxy"  HTTP_PROXY="$http_proxy"  NO_PROXY="$no_proxy"
	expg    prox ;  ##--echo $https_proxy  $http_proxy
}  ##--2do--not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!
###________________________________________  ___________________________



#####  ==========  prjetc/py-prj/....:
##--!?-did NOT work on mswin--MSYS !!: source  ${q_prjEtcDP}/pytest_autocomplete   ##--generated with register-python-argcomplete pytest >> xxx ; pip install argcomplete ; #see pytest-howto-REFdocs!
###________________________________________  ___________________________


#####  ==========  cu/tr/chks/tmps:
dj1dntsDP="${q_pyydntsDP}/djangos_dnts_py"
dj1DocsRTDP="${dcItDP}/dj_dc"
dj1DocsTxtDP="${dj1DocsRTDP}/django-docs/_sources"
alias cddj1dnts="cdlla ${dj1dntsDP}"
alias cddj1docs="cdlla ${dj1DocsRTDP}"
alias cddj1docstxt="cdlla ${dj1DocsTxtDP}"
grdj1docs() { grepi -r "$1"  ${dj1DocsTxtDP} ; }
###________________________________________  ___________________________



#####  ==========  finals-prjPosProfs (basically overwrite everything, if needed, finally):
#- export  HISTFILE="/var/tmp/tmpu/.hf1_ev1"
###________________________________________  ___________________________
#
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

