set -a
q_pls1  "${BASH_SOURCE[0]##*/}"


q_pyyName=python ; q_pyyTag=py ; q_pyyTagC="${q_pyyTag^}"

#	_______:  installs/Home/..._pyy:
: ${q_pyyHome1_DP:="/usr/lib/python3.11"}  ##--will be preset in mswProf! so set the default here for Lx!
: ${q_pyyHome1Lib_DP:="${q_pyyHome1_DP}/xxx-to-be-set"}
: ${q_pyyHome1Scripts_DP="${q_pyyHome1_DP}/xxx-to-be-set"}
: ${q_pyyexe:="${q_pyyHome1_DP}/xxx-to-be-set"}

#	_______:  VARs-allg_pyy:
q_pyyVar1_DP="${vaarAuDP}/py1var/"
PYTHONPYCACHEPREFIX="${q_pyyVar1_DP}/0pycs/"   ##--II- woks?? as target-dir for ALL pyc-files instead local-source-dir! same as -X -X pycache_prefix=PATH: ... BUT NOT-documented in man python !! works??
PAGER=less   ##--for pydoc
# __if_req:  q_prjSTARTUP=${q_prjEtcDP}/pystartup1.py  ##--python-startup-script

#  _______:  w1-pathes_pyy:
q_pyydntsDP="${dntsDP}/${q_pyyTag}${q_Label1dnts}"
q_pyydresDP="${dresCodecsDP}/${q_pyyTag}${q_Label1dres}"
q_pyydres1kkDP="${dresCodecsDP}/${q_pyyTag}${q_Label1dres1kk}"
q_pyyDocsDP="${dcItDP}/${q_pyyTagC}_dc"
q_pyyDocsRefsDP="${q_pyyDocsDP}/PyRefs_dc"
q_pyyDocsRefsTxtDP="${q_pyyDocsRefsDP}/docs-txt"
q_pyyDocsVarDP="${docsvarDP}/${q_pyyTagC}_docsvar"
q_pyySrcRefsDP="${q_pyyHome1Lib_DP}"
q_pyySrcRefs_C_DP="${q_pyyDocsVarDP}/PyRefsSrc"

#	_______:  PATH-addies_pyy:
# only-in-msw-required!

#	_______:  funcs-prj-specifics / py: 
path2pymod() { echo $1 | sed -e 's@^[~./]*@@' -e 's@.py$@@' -e 's@/@.@g' ; }  ##--converts filepath-to-python-module-pkg-path !

#	_______:  aliases-pyy:
#--- w1-w1var-varau-aliases-pyy:
alias  cdpydnts='cdlla  $q_pyydntsDP'
alias  cdpydres='cdlla  $q_pyydres1kkDP'
alias  cdpydocs='cdlla  $q_pyyDocsDP'
alias  cdpydocsrefs='cdlla  $q_pyyDocsRefsDP'
alias  cdpydocsrefstxt='cdlla  $q_pyyDocsRefsTxtDP'
alias  cdpydocsvar='cdlla  $q_pyyDocsVarDP'
alias  cdpysrcrefs='cdlla  $q_pyySrcRefsDP'
#--- pyy-installs,...-aliases:
alias  cdpyhome1='cdlla  ${q_pyyHome1_DP}/'
alias  pydoc1='PAGER=less  $q_pyyexe  -m pydoc'  ##-I-only pydoc calls usu. /usr/bin/pydoc of MSYS with its own python-pkg! so to use the msw-installed-py, you have to call it as -m with pyExe !
alias  pypath='echo "PYTHONPATH  is:  ${PYTHONPATH}" ; echo "---PYTHONPATH-lines (ignore emptylines):" ; echo -e ${PYTHONPATH//:/"\n"}'  ##--search-pathes for modules/packages/...; the beginning-and-ending/redundant ":" can be also deleted with: echo -e "${PYTHONPATH/#:/}"  bzw. echo -e "${PYTHONPATH/%:/}" , but so ok! ignore the emptylines !
alias  pysyspath='python -c "import sys; [print(ii) for ii in  sys.path ];"'
alias  rmpycaches='rm -rf -v  $(find . -name "__pycache__" -o -name ".pytest_cache" -type d)'  #-I-other following variants with find-exec NOT working on msw/MSYS2, dut to big-ENV !
#_not-working-on-msw/MSYS2:  alias  rmpycaches='find . -name "__pycache__" -type d -exec rm -rf {} \;' ; alias  rmpytestcaches='find . -name "pytest_cache" -type d -exec rm -rf {} \;'

# _______:  djangos_Allg + prj1:
#---dj-vars-w1:  docs/-dnts/...:
dj1dntsDP="${q_pyydntsDP}/djangos_dnts_py"
dj1DocsRTDP="${dcItDP}/dj_dc"
dj1DocsTxtDP="${dj1DocsRTDP}/django-docs/_sources"
dj1SrcDP="${q_pyyHome1_DP}/lib/site-packages/django"
grdj1docs() { grepi -r "$1"  ${dj1DocsTxtDP} ; }
#--- alias-dj-manage.py:
alias dj1s='python -m manage  runserver'
alias dj1m='python -m manage  migrate'
alias dj1venv_msw='source  ../ve1/Scripts/activate'  ##--in-msw-in-prjRDP
#--- alias-dj-w1:
alias  cddj1dnts="cdlla ${dj1dntsDP}"
alias  cddj1docs="cdlla ${dj1DocsRTDP}"
alias  cddj1docstxt="cdlla ${dj1DocsTxtDP}"
alias  cddj1src="cdlla ${dj1SrcDP}"
alias  pydocdj='python  -c "import django, django.conf, pydoc ; django.conf.settings.configure() ; django.setup() ; pydoc.cli()"'
#-pydocdj1 so not-worked-on-nsv-pc:  alias  pydocdj='DJANGO_SETTINGS_MODULE=django.conf.global_settings  python  -c "import django, pydoc ; django.setup() ; pydoc.cli()"'  ##--django-pydoc-call


#####  ==========  MySqls/MariaDBs:
##---  VARs-mys: ----------------------------------------
export MYSQL_HISTFILE=${ettcUser}/hs1_mysq

##---  evv-VARs-mys: ------------------------------------
:  ${q_mysUsr1:='netservices'}
:  ${q_mysAdm1:='root'}
:  ${q_mysUsr1PW1:='wwee'}   #-!-no-space after -p !
:  ${q_mysAdm1PW1:='wwee'}   #-!-no-space after -p !
:  ${q_mysHost1:='localhost'}
:  ${q_mysDB1:='netservices'}
:  ${q_mysPrompt1:='\u.\d.\h\_sql>\_'}
:  ${q_mysParams1:='--auto-rehash  --progress-reports  --table'}
:  ${q_mysParams1p:="--auto-rehash  --progress-reports  --table  --prompt ${q_mysPrompt1}"}
:  ${q_mysLoginUsr1:="-u $q_mysUsr1 -p$q_mysUsr1PW1 -h $q_mysHost1"}  ##-mysql-user-login-1 (u11/u22/...)
:  ${q_mysLoginAdm1:="-u $q_mysAdm1 -p$q_mysAdm1PW1 -h $q_mysHost1"}  ##-mysql-adm--login-1 (root)
:  ${q_mysLoginUsr1DB:="$q_mysLoginUsr1 -D "$q_mysDB1}"
:  ${q_mysLoginAdm1DB:="$q_mysLoginAdm1 -D "$q_mysDB1}"
:  ${q_mysConf1_FN:='mys1.cnf'}  ##--mysql-conf
:  ${q_mysConf1_FP:="${ettcUser}/${q_mysConf1_FN}"}

##---  aliases-mys: -------------------------------------
alias  mysqlusr1='mysql  $q_mysLoginUsr1DB  $q_mysParams1p'
alias  mysqladm1='mysql  $q_mysLoginAdm1DB  $q_mysParams1p'
alias  mysqladmin1='mysqladmin $q_mysLoginAdm1'

##--- aliases-mys-conffile-usages: ---------------------------------
alias  vimyscnf1='vi1 ${q_mysConf1_FP}'
alias  gvimyscnf1='gvi1 ${q_mysConf1_FP}'
alias  mysqlcnf1='mysql  --defaults-file="${q_mysConf1_FP}"'   ##--I-for root just append to it: -u root  #if both have same PW, otherwise also -pxxx !
alias  mysqldumpcnf1='mysqldump  --defaults-file="${q_mysConf1_FP}"'   ##--I-for root just append to it: -u root  #if both have same PW, otherwise also -pxxx !

##--- aliases-myclis (id reads ONLY [client] section of confgile, and does NOT forward/understand all mysql-params! so handle it separately as mysql call !! )
alias  mycliusr1='mycli $q_mysLoginUsr1DB  --prompt "$q_mysPrompt1"'
alias  mycliadm1='mycli $q_mysLoginAdm1DB  --prompt "$q_mysPrompt1"'
alias  myclicnf1='mycli  --defaults-file="${q_mysConf1_FP}" --prompt "$q_mysPrompt1"  -D $q_mysDB1'  ##-- mycli reads ONLY [client] section of confFIle! so addies !

##--- OKs einzel-params,...:
#-ok1: alias  mysql1='mysql -u "$q_mysUsr1" -p"$q_mysUsr1PW1" -h "$q_mysHost1" -D "$q_mysDB1"  --prompt "$q_mysPrompt1"  $q_mysParams1'
#-ok1: alias  mycli1='mycli -u "$q_mysUsr1" -p"$q_mysUsr1PW1" -h "$q_mysHost1" -D "$q_mysDB1"  --prompt "$q_mysPrompt1"'  #  $q_mysParams1'
###________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"
##################################################################################################
