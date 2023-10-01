set -a
#--1org_was?? myname.settings: export myname_org_cu="${BASH_SOURCE[0]##*/}" ; myname_cu=${myname_org_cu//./_} ; declare -xi ${myname_cu}=${!myname_cu:-0}  ##- int-counter ; q_pls1  "${myname_org_cu}"
q_pls1  "${BASH_SOURCE[0]##*/}"

################### SW1/main-SW/installed-Package-/App-Refs: install.setup,rpms....of the APP : here PYTHON ####################
#-------- 
SW1Version='3.11'           ##-- current-rpm-version of setup
SW1SetupRTDP="/usr/lib"
SW1NameVer="${SW1Name}${SW1Version}"
SW1Libs1DN="${SW1NameVer}"
SW1Libs1DP="${SW1SetupRTDP}/${SW1Libs1DN}"

#-------- more specific-pkg/docs/dirs.... SW1 :
SW1RefdocsvarDP="${SW1DocsvarDP}/0-RefDocsVar_py/"  ##--RefDocs unpacked,unzipped,.... in docsvar-dir !
SW1RefdocsvarTxtDP="${SW1RefdocsvarDP}/docs-text/"   ##--I-for greps ...!
#===========================================================================

################### prj-specifics-VARs/aliases/funcs/addies (not in prj0-files): #############################)
##========== VARs-prj-specifics: 
prjSTARTUP=${prjEtcDP}/pystartup1.py  ##--python-startup-script
##========== funcs-prj-specifics: 
##========== aliases-prj-specifics: 
alias  epypathlines='echo "PYTHONPATH  is:  ${PYTHONPATH}" ; echo "---PYTHONPATH-lines (ignore emptylines):" ; echo -e ${PYTHONPATH//:/"\n"}'  ##--search-pathes for modules/packages/...; the beginning-and-ending/redundant ":" can be also deleted with: echo -e "${PYTHONPATH/#:/}"  bzw. echo -e "${PYTHONPATH/%:/}" , but so ok! ignore the emptylines !
alias  pydoc-dj='DJANGO_SETTINGS_MODULE=django.conf.global_settings  python  -c "import django, pydoc ; django.setup() ; pydoc.cli()"'  ##--django-pydoc-call

################### SW1+pkg-vars--Finals, ...: ###########################
: ${PYTHONPYCACHEPREFIX:="${prjVarDP}/0pycs/"}   ##--II- woks?? as target-dir for ALL pyc-files instead local-source-dir! same as -X -X pycache_prefix=PATH: ... BUT NOT-documented in man python !! works??
: ${PYTHONPATH:=":.:${prjLibsDP}:"}   ##--II-!! if needed unset/change/...
: ${PYTHONSTARTUP:="${prjSTARTUP}"}   ##--I-for py-interactiv-shell like .profile-for-bash
##__  NO-pyc-files-generation-at-all :  : ${PYTHONDONTWRITEBYTECODE:="NoPycache"}   ##--I-for dev ok, but now for frameworks as django,... better generating pyc-files ! also ok for py-interactiv-shell ...


#--1org_was??:   mynames-cu-final: ; (( ${myname_cu}+=1 )) ; q_ple1  "${myname_org_cu} : ${!myname_cu}"
q_ple1  "${BASH_SOURCE[0]##*/}"
