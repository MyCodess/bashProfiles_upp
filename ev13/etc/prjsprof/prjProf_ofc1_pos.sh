set -a
#--1org_was?? myname.settings: export myname_org_cu="${BASH_SOURCE[0]##*/}" ; myname_cu=${myname_org_cu//./_} ; declare -xi ${myname_cu}=${!myname_cu:-0}  ##- int-counter ; q_pls1  "${myname_org_cu}"
q_pls1  "${BASH_SOURCE[0]##*/}"


#####  ==========  evv-mswin-modifs-ofc1:
##---vims:
vimrcFP=${q_prjEtcDP}/vimrc
gvimrcFP=${q_prjEtcDP}/gvimrc
VIMINIT="source  ${vimrcFP}"
GVIMINIT="source ${gvimrcFP}"
##---------------
##________________________________________  ___________________________


################### SW1/main-SW/installed-Package-/App-Refs: install.setup,rpms....of the APP : here PYTHON ####################
#-------- 
q_SW1Version='3.11'           ##-- current-rpm-version of setup
q_SW1SetupRTDP="/usr/lib"
q_SW1NameVer="${q_SW1Name}${q_SW1Version}"
q_SW1Libs1DN="${q_SW1NameVer}"
q_SW1Libs1DP="${q_SW1SetupRTDP}/${q_SW1Libs1DN}"

#-------- more specific-pkg/docs/dirs.... SW1 :
q_SW1RefdocsvarDP="${q_SW1DocsvarDP}/0-RefDocsVar_py/"  ##--RefDocs unpacked,unzipped,.... in docsvar-dir !
q_SW1RefdocsvarTxtDP="${q_SW1RefdocsvarDP}/docs-text/"   ##--I-for greps ...!
#===========================================================================

################### prj-specifics-VARs/aliases/funcs/addies (not in prj0-files): #############################)
##========== VARs-prj-specifics: 
q_prjSTARTUP=${q_prjEtcDP}/pystartup1.py  ##--python-startup-script
##========== funcs-prj-specifics: 
##========== aliases-prj-specifics: 
alias  pydoc1="python -m pydoc"
alias  epypathlines='echo "PYTHONPATH  is:  ${PYTHONPATH}" ; echo "---PYTHONPATH-lines (ignore emptylines):" ; echo -e ${PYTHONPATH//:/"\n"}'  ##--search-pathes for modules/packages/...; the beginning-and-ending/redundant ":" can be also deleted with: echo -e "${PYTHONPATH/#:/}"  bzw. echo -e "${PYTHONPATH/%:/}" , but so ok! ignore the emptylines !
alias  pydoc-dj='DJANGO_SETTINGS_MODULE=django.conf.global_settings  python  -c "import django, pydoc ; django.setup() ; pydoc.cli()"'  ##--django-pydoc-call

################### SW1+pkg-vars--Finals, ...: ###########################
: ${PYTHONPYCACHEPREFIX:="${q_prjVarDP}/0pycs/"}   ##--II- woks?? as target-dir for ALL pyc-files instead local-source-dir! same as -X -X pycache_prefix=PATH: ... BUT NOT-documented in man python !! works??
##__  : ${PYTHONPATH:=":.:${q_prjLibsDP}:"}   ##--II-!! if needed unset/change/...
##__  : ${PYTHONSTARTUP:="${q_prjSTARTUP}"}   ##--I-for py-interactiv-shell like .profile-for-bash
##__    NO-pyc-files-generation-at-all :  : ${PYTHONDONTWRITEBYTECODE:="NoPycache"}   ##--I-for dev ok, but now for frameworks as django,... better generating pyc-files ! also ok for py-interactiv-shell ...


#--1org_was??:   mynames-cu-final: ; (( ${myname_cu}+=1 )) ; q_ple1  "${myname_org_cu} : ${!myname_cu}"
q_ple1  "${BASH_SOURCE[0]##*/}"
