set -a
q_pls1  "${BASH_SOURCE[0]##*/}"

#####  ==========  PRJ-specifics-apps-VARs/aliases/funcs/addies (not in prj0-files):
#	_______:  djangoPrj:
##__  export  q_djangoSettingsDev="netservices.settings.dev"
##__  export  DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-netservices.settings.dev}   ##--as default
alias  setdjsettingdev="export DJANGO_SETTINGS_MODULE=netservices.settings.dev"
alias  setdjsettingtest="export DJANGO_SETTINGS_MODULE=netservices.settings.test"
alias  setdjsettingsrv="export DJANGO_SETTINGS_MODULE=netservices.settings.server"
###________________________________________  ___________________________


#####  ==========  prj-specifics/devls-prj VARs/funcs/alias/...:
alias   setsmoke='declare -ix  SMOKE_TESTS=10;  declare -p SMOKE_TESTS'
alias   unsetsmoke='unset SMOKE_TESTS'
###________________________________________  ___________________________


#####  ==========  terms1s with wt /prj: ==========================================
#_______:  te1_basics:
#--II- MSYS2-abbrev-evv == "mys"  , wt-profile: "myst1" , wt-start-cmd:  C:\msys64\msys2_shell.cmd  -defterm  -here  -no-start  -ucrt64
te11_myswt() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title]   ##--starts a MSYS2-bash-shell in wt-term and cd to start-DIR" ;
	local dir11="${1:?$usage11}" ; local tit11="${2:-$wt_tit11}" ; shift 2 ; wt -w "$tit11" nt -p myst1 --title "$tit11" -d $dir11 "$@" ; }

# _______:  te1_prjcode2/ ck1:
q_prjcode2DN="ck1";
#---prjcodeNo:
q_prjcode2DP="${q_prjcode1DP}/${q_prjcode2DN}/netservices"  ; q_prjcode2Title=P_${q_prjcode2DN} ;
prjcode2dir11="${q_prjcode2DP}/  ${q_prjcode2DP}/  ${q_prjcode2DP}/  ${q_prjcode2DP}/  ${q_prjcode2DP}/"
te1_pc2()  { for ii in $prjcode2dir11; do te11_myswt   $ii $q_prjcode2Title ; done ; } ;
alias  cdpc2='cdlla   ${q_prjcode2DP}' ;
alias  setpypathcode2='export PYTHONPATH="${q_prjcode2DP}/:${q_prjcode2DP}/lib/:${q_prjcode2DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
#---prjcodeName (assign prjcodeNo-to-prjcodeName):
q_prjcodeck1DP="${q_prjcode2DP}";
alias te1_pcck1=te1_pc2 ; alias  cdpcck1='cdlla   ${q_prjcodeck1DP}' ; alias  setpypathcodeck1=setpypathcode2

# _______:  te1_prjcode3/ djix1:
q_prjcode3DN="djix1";
#---prjcodeNo:
q_prjcode3DP="${q_prjcode1DP}/${q_prjcode3DN}/netservices"  ; q_prjcode3Title=P_${q_prjcode3DN} ;
prjcode3dir11="${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/"
te1_pc3()  { for ii in $prjcode3dir11; do te11_myswt   $ii $q_prjcode3Title ; done ; } ;
alias  cdpc3='cdlla   ${q_prjcode3DP}' ;
alias  setpypathcode3='export PYTHONPATH="${q_prjcode3DP}/:${q_prjcode3DP}/lib/:${q_prjcode3DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
#---prjcodeName (assign prjcodeNo-to-prjcodeName):
q_prjcodedjix1DP="${q_prjcode3DP}";
alias te1_pcdjix1=te1_pc3 ; alias  cdpcdjix1='cdlla   ${q_prjcodedjix1DP}' ; alias  setpypathcodedjix1=setpypathcode3

# _______:  te1_prjcode4/ pki1:
q_prjcode4DN="pki1";
#---prjcodeNo:
q_prjcode4DP="${q_prjcode1DP}/${q_prjcode4DN}/netservices"  ; q_prjcode4Title=P_${q_prjcode4DN} ;
prjcode4dir11="${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/"
te1_pc4()  { for ii in $prjcode4dir11; do te11_myswt   $ii $q_prjcode4Title ; done ; } ;
alias  cdpc4='cdlla   ${q_prjcode4DP}' ;
alias  setpypathcode4='export PYTHONPATH="${q_prjcode4DP}/:${q_prjcode4DP}/lib/:${q_prjcode4DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
#---prjcodeName (assign prjcodeNo-to-prjcodeName):
q_prjcodepki1DP="${q_prjcode4DP}";
alias te1_pcpki1=te1_pc4 ; alias  cdpcpki1='cdlla   ${q_prjcodepki1DP}' ; alias  setpypathcodepki1=setpypathcode4

# _______:  te1_prjcodewk1 (a bit diff than prjcodeX !):
q_prjcodeWk1DN="works1" ; q_prjcodeWk1DP="${q_prjcode1DP}/${q_prjcodeWk1DN}"    ; q_prjcodeWk1Title=P_${q_prjcodeWk1DN} ;
wksdirs11="${vaarAuTestsDP}/  ${vaarAuWorksDP}/  ${q_prjWksDP}/  ${q_prjcodeWk1DP}/  ${q_prjcodeWk1DP}/"
te1_pcwk1() { for ii in $prjcodewk1dir11; do te11_myswt  $ii $q_prjcodeWk1Title ; done ; }
alias  cdpcwk1='cdlla   ${q_prjcodeWk1DP}'

# _______:  te1_evvs /te1-fest (NON-prjcodeX):
dresdir11="${dresDP}/  ${dntsDP}/  ${mssdntsDP}  ${q_SW1dntsDP}/  ${q_SW1dres1kkDP}/"
prjntsdir11="${q_prjDP}/  ${q_prjDntsDP}/  ${q_prjDntsDP}/  ${q_prjcode1DP}/  ${q_EttcDP}/  ${q_EttcDP}/"  ##--prj-dnts-wpad-terms + evv
prjcodewk1dir11="${q_prjcodeWk1DP}/  ${q_prjcodeWk1DP}/  ${q_prjcodeWk1DP}/"
#---call te1_fixes/evvs (non-prjcodeX):
te1_wks()       { for ii in $wksdirs11;  do te11_myswt $ii wks_t1; done ; }
te1_dres()      { for ii in $dresdir11; do te11_myswt $ii dres_t1; done ; }
te1_prjnts()    { for ii in $prjntsdir11; do te11_myswt $ii P_Nts; done ; }
te1_cons1()     { for ii in 1 2 3; do te11_myswt  $q_prjTestsDP  cons1  --tabColor "#FFFF00"; done ; }
#---cu-/tmp-terms:
te1_pysrc() { cdpydocs ; for ii in  .   ./PyRefsSrc/   ./PyRefsSrc/Doc ./PyRefsSrc/Doc  ./PyRefsSrc/Doc   ;do te11_myswt $ii pySrc ; done }
te1_sqls() { for ii in ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${opptuDP}/mariadb  ${dntsDP}/dbs-sqls_dnts/mysqls_mariadb_dnts  ${q_prjDntsDP}/mysqls_nsv_dnts ; do te11_myswt $ii sqls_t1 ; done }
#---cu-te1-calls-chain:
#-alias  te1_cu1s='te1_wks ; read -t 2 ; te1_dres ; read -t 2 ; te1_prjnts ; read -t 2 ; te1_pc4 ;'  ##-- te1_cons1 ; te1_vi ;
alias  te1_cu1s='for ii in te1_vi  te1_wks  te1_dres  te1_prjnts  te1_pc4 ; do $ii; read -t 2; done'
###________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"
##################################################################################################
