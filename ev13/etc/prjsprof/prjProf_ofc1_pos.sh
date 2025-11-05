set -a
q_pls1  "${BASH_SOURCE[0]##*/}"

#####  ==========  PRJ-specifics-apps-VARs/aliases/funcs/addies (not in prj0-files):
#	_______:  djangoPrj:
##__  export  q_djangoSettingsDev="netservices.settings.dev"
##__  export  DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE:-netservices.settings.dev}   ##--as default
alias  setdjsettingdev="export DJANGO_SETTINGS_MODULE=netservices.settings.dev"
alias  setdjsettingtest="export DJANGO_SETTINGS_MODULE=netservices.settings.test"
alias  setdjsettingsrv="export DJANGO_SETTINGS_MODULE=netservices.settings.server"
alias  setdjsettingdb="export DJANGO_SETTINGS_MODULE=netservices.settings.db"  ##--devpc-own-1kk-dummy-devl-setting!
#_______:  ve1,...:
alias  ve1act='source ../ve1/Scripts/activate ; setdjsettingdb ; setsmoke ;'  #-ve1-activate + ...
###________________________________________  ___________________________


#####  ==========  prj-specifics/devls-prj VARs/funcs/alias/...:
alias   setsmoke='declare -ix  SMOKE_TESTS=10;  declare -p SMOKE_TESTS'
alias   unsetsmoke='unset SMOKE_TESTS'
###________________________________________  ___________________________


#####  ==========  te1s with wt /prj: ==========================================
#_______:  te1_basics:
#--II- MSYS2-abbrev-evv == "mys"  , wt-profile: "myst1" , wt-start-cmd:  C:\msys64\msys2_shell.cmd  -defterm  -here  -no-start  -ucrt64
te11_myswt() { usage11="USAGE: ... <start-DIR> [title/winID /OR wt_tit11=my-title]   ##--starts a MSYS2-bash-shell in wt-term and cd to start-DIR" ;
	local dir11="${1:?$usage11}" ; local tit11="${2:-$wt_tit11}" ; shift 2 ; wt -w "$tit11" nt -p myst1 --title "$tit11" -d $dir11 "$@" ; }

# _______:  te1_prjcodewks1 (a bit diff than prjcodeX !):
#-1ok--based-on-cod1-DP:   q_prjcodeWks1DN="wkscod1" ; q_prjcodeWks1DP="${q_prjcode1DP}/${q_prjcodeWks1DN}"    ; q_prjcodeWks1Title=P_${q_prjcodeWks1DN} ;
q_prjcodeWks1DN="wkscod1" ; q_prjcodeWks1DP="${q_prjDP}/${q_prjcodeWks1DN}"    ; q_prjcodeWks1Title=P_${q_prjcodeWks1DN} ;
prjcodewks1dir11="${q_prjcodeWks1DP}/  ${q_prjcodeWks1DP}/  ${q_prjcodeWks1DP}/"
te1_pcwks1() { for ii in $prjcodewks1dir11; do te11_myswt  $ii $q_prjcodeWks1Title ; done ; }
alias  cdpcwks1='cdlla   ${q_prjcodeWks1DP}'

# _______:  te1_prjcode5/ pacfe1:
q_prjcode5DN="pacfe1";
q_prjcode5DP="${q_prjcode1DP}/${q_prjcode5DN}/netservices"  ; q_prjcode5Title=P_${q_prjcode5DN} ;
prjcode5dir11="${q_prjcode5DP}/  ${q_prjcode5DP}/  ${q_prjcode5DP}/  ${q_prjcode5DP}/tests/integration/  ${q_prjcode5DP}/tests/integration/"
prjcode5wkDN="250800_pacfe1_wk"; prjcode5wkDP="${q_prjcodeWks1DP}/${prjcode5wkDN}"; prjcode5works1DP="${prjcode5wkDP}/works1"
te1_pc5()  { for ii in $prjcode5dir11; do te11_myswt   $ii $q_prjcode5Title ; done ; } ;
te1_pc5works1() { for ii in $prjcode5works1DP $prjcode5works1DP $prjcode5works1DP; do te11_myswt  $ii $q_prjcodeWks1Title ; done ; } #-used same title as te1_pcwks1(), OK!
alias  cdpc5='cdlla   ${q_prjcode5DP}' ;  alias  cdpc5works1='cdla ${prjcode5works1DP}' ;
alias  setpypathcode5='export PYTHONPATH="${q_prjcode5DP}/:${q_prjcode5DP}/lib/:${q_prjcode5DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'

# _______:  te1-fixies-dirs: te1_wks / te1_evvs /te1-fest (NON-prjcodeX):
wksdirs11="${vaarAuTestsDP}/  ${vaarAuWorksDP}/  ${q_prjWksDP}/  ${q_prjcodeWks1DP}/  ${q_prjcodeWks1DP}/"
dresdir11="${dresDP}/  ${dntsDP}/  ${mssdntsDP}  ${q_SW1dres1kkDP}/  ${q_SW1dntsDP}/"
prjntsdir11="${q_prjDP}/  ${q_prjDntsDP}/  ${q_prjDntsDP}/  ${q_prjcode1DP}/  ${q_EttcDP}/  ${q_EttcDP}/"  ##--prj-dnts-wpad-term + evv

#_______:  call te1_fixes/evvs (non-prjcodeX):
te1_wks()       { for ii in $wksdirs11;  do te11_myswt $ii wks_t1; done ; }
te1_dres()      { for ii in $dresdir11; do te11_myswt $ii dres_t1; done ; }
te1_prjnts()    { for ii in $prjntsdir11; do te11_myswt $ii P_Nts; done ; }
te1_cons1()     { for ii in 1 2 3; do te11_myswt  $q_prjTestsDP  cons1  --tabColor "#FFFF00"; done ; }

#_______:  cu-/tmp-term:
te1_pysrc() { cdpydocs ; for ii in  .   ./PyRefsSrc/   ./PyRefsSrc/Doc ./PyRefsSrc/Doc  ./PyRefsSrc/Doc   ;do te11_myswt $ii pySrc ; done }
te1_sqls() { for ii in ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${vaarAuWorksDP}/mysqls-wk1  ${opptuDP}/mariadb  ${dntsDP}/dbs-sqls_dnts/mysqls_mariadb_dnts  ${q_prjDntsDP}/mysqls_nsv_dnts ; do te11_myswt $ii sqls_t1 ; done }

#_______:  cu-pc , cu-te1-calls-chain , cu-xxx :
alias  te1_pcc=te1_pc5 ; alias te1_pccworks1=te1_pc5works1
alias  cdpcc=cdpc5 ; alias cdpccworks1=cdpc5works1 ; alias  setpypathcodepcc=setpypathcode5 ;
alias  te1_cu1s='for ii in te1_vi  te1_wks  te1_dres  te1_prjnts  te1_pccu ; do $ii; read -t 2; done'
#-alias  te1_cu1s='te1_wks ; read -t 2 ; te1_dres ; read -t 2 ; te1_prjnts ; read -t 2 ; te1_pc4 ;'  ##-- te1_cons1 ; te1_vi ;
###________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"
##################################################################################################


##############################  prev: pcxx, ...:  ################################################
#####  ==========  pcXXX / prj-codes-xxx prev:  =============================
###__  # _______:  te1_prjcode3/ djix1:
##__  q_prjcode3DN="djix1";
##__  #---prjcodeNo:
##__  q_prjcode3DP="${q_prjcode1DP}/${q_prjcode3DN}/netservices"  ; q_prjcode3Title=P_${q_prjcode3DN} ;
##__  prjcode3dir11="${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/  ${q_prjcode3DP}/"
##__  te1_pc3()  { for ii in $prjcode3dir11; do te11_myswt   $ii $q_prjcode3Title ; done ; } ;
##__  alias  cdpc3='cdlla   ${q_prjcode3DP}' ;
##__  alias  setpypathcode3='export PYTHONPATH="${q_prjcode3DP}/:${q_prjcode3DP}/lib/:${q_prjcode3DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
##__  #---prjcodeName (assign prjcodeNo-to-prjcodeName):
##__  q_prjcodedjix1DP="${q_prjcode3DP}";
##__  alias te1_pcdjix1=te1_pc3 ; alias  cdpcdjix1='cdlla   ${q_prjcodedjix1DP}' ; alias  setpypathcodedjix1=setpypathcode3
##__  
##__  # _______:  te1_prjcode4/ pki1:
##__  q_prjcode4DN="pki1";
##__  #---prjcodeNo:
##__  q_prjcode4DP="${q_prjcode1DP}/${q_prjcode4DN}/netservices"  ; q_prjcode4Title=P_${q_prjcode4DN} ;
##__  prjcode4dir11="${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/  ${q_prjcode4DP}/"
##__  te1_pc4()  { for ii in $prjcode4dir11; do te11_myswt   $ii $q_prjcode4Title ; done ; } ;
##__  alias  cdpc4='cdlla   ${q_prjcode4DP}' ;
##__  alias  setpypathcode4='export PYTHONPATH="${q_prjcode4DP}/:${q_prjcode4DP}/lib/:${q_prjcode4DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
##__  #---prjcodeName (assign prjcodeNo-to-prjcodeName):
##__  q_prjcodepki1DP="${q_prjcode4DP}";
##__  alias te1_pcpki1=te1_pc4 ; alias  cdpcpki1='cdlla   ${q_prjcodepki1DP}' ; alias  setpypathcodepki1=setpypathcode4
##__  
##__  # _______:  te1_prjcode2/ tuf1:
##__  q_prjcode2DN="tuf1";
##__  #---prjcodeNo:
##__  q_prjcode2DP="${q_prjcode1DP}/${q_prjcode2DN}/netservices"  ; q_prjcode2Title=P_${q_prjcode2DN} ;
##__  prjcode2dir11="${q_prjcode2DP}/  ${q_prjcode2DP}/  ${q_prjcode2DP}/  ${q_prjcode2DP}/tests/unit/lib/tufin/  ${q_prjcode2DP}/tests/integration/lib/tufin/"
##__  te1_pc2()  { for ii in $prjcode2dir11; do te11_myswt   $ii $q_prjcode2Title ; done ; } ;
##__  alias  cdpc2='cdlla   ${q_prjcode2DP}' ;
##__  alias  setpypathcode2='export PYTHONPATH="${q_prjcode2DP}/:${q_prjcode2DP}/lib/:${q_prjcode2DP}/netservices/" ; pypath ;' ##__ echo "PYTHONPATH set to: $PYTHONPATH"'
##__  #---prjcodeName (assign prjcodeNo-to-prjcodeName):
###________________________________________  ___________________________

##__  q_prjcodetuf1DP="${q_prjcode2DP}";
##__  alias te1_pctuf1=te1_pc2 ; alias  cdpctuf1='cdlla   ${q_prjcodetuf1DP}' ; alias  setpypathcodetuf1=setpypathcode2
##__  
