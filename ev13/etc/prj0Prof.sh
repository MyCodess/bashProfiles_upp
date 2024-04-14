##__  #!/bin/bash
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;

#################### PRE-COMMON-all-PRJs: ####################################
:  ${q_prj0DP:="${q_UppDP}/prjs"}         ##--I- real-phys-path-needed??:  ${q_prj0DPReal:="${vaarAuDP}/prjs"}  
:  ${q_prjsProfDP:="${q_EttcDP}/prjsprof"}

################### prjs-part: #############################################
##--USAGE11:  
	##--Either manually/Only-for-certain-Terminals:   prjID_active1=py1   sus1 ;
	##--OR hard-coded here for all evv-terminals, eg:  source  ${q_prjsProfDP}/prjProf_py1.sh  
##-!!-nts_VOCAB:
	##-!! prjID_active1 may NOT be prefixed with q_ ! because the user must be able to set it in a terminal for switching to another prj and then calling sus1unset !!
	##- prj <---> SW1 in VAR-names :  eg: prj... is py1-dirs/... ,and its Software/topic/... is SW1...
	##- whereas eg: py1 is a specific project , but PYTHON is its global.pkg/software

##__py-prj:   :  ${prjID_active1:="py1"}    ##--II-set this on-the-terminal-cmdline to your prjID, if wanted in one-terminal to have this prj-env !
##__ofc1-prj:   
:  ${prjID_active1:="ofc1"}    ##--II-set this on-the-terminal-cmdline to your prjID, if wanted in one-terminal to have this prj-env !

##__
[[ $prjID_active1 ]] && { 
:	${q_prjProfFP:="${q_prjsProfDP}/prjProf_${prjID_active1}.sh"} ;
: 	${q_prjProfPosFP:="${q_prjsProfDP}/prjProf_${prjID_active1}_pos.sh"} ;
	source ${q_prjProfFP} ;  ##--later here at the end  q_prjProfPosFP will be sourced!
}
#################### POST-COMMON-all-PRJs: #################################################################
##========== post-pathes-/vars-prjX valid for all prjX after their prjProf_xxx.sh : =====================
#---------- level.1 : prjX-roots-DPs of PRJ: prj.devel + prjVar + prjPkgs  DIRs/pathes: : --------------
q_prjDP_upp="${q_prj0DP}/${q_prjID}"   ##-I- prj.devel/wks-root ##-??- prjTag instead prjNo ??  ##--2Do- wks/devel-dir NOT in vaarAuDP, but hier on vo17 just doing so....
q_prjDP="$( cd ${q_prj0DP}/${q_prjID} && pwd -P )"   ##-I-??-ok? take now the real-path of prj-dir !

#--------- level.2 : prjX-sub-dirs,  : --------------
q_prjAppsDP="${q_prjDP}/apps1"  ##- as sqls,.pysqls,... : Bez.ok??
q_prjBM1DP="${q_prjDP}/bm1_links"
q_prjBinDP="${q_prjDP}/bin"
q_prjCasesDP="${q_prjDP}/cases1"
q_prjCode1DP="${q_prjDP}/cod1"
q_prjDocsDP="${q_prjDP}/docs1"
q_prjDntsDP="${q_prjDP}/dnts1"
q_prjEtcDP="${q_prjDP}/etc"
q_prjFuncsDP="${q_prjBinDP}/funcs1"
q_prjLibsDP="${q_prjDP}/libs1"
q_prjTestsDP="${q_prjDP}/tsts1"
q_prjTmpDP="${q_prjDP}/tmp1"
q_prjUtilsDP="${q_prjDP}/utils1"
q_prjVarDP="${q_prjDP}/var1"   ##--II- DO a symlink here to vaarAu-prjvar! But it is/was really :  q_prjVarDP="${vaarAuDP}/${q_prjID}var"
q_prjWksDP="${q_prjDP}/wks1"
q_prjWpadsDP="${q_prjDP}/wpd1"

#--------- level.3+: prjX-var-sub-dirs : --------------------------
q_prjUnpDP="${q_prjVarDP}/unp"
q_prjPkgsDP="${q_prjVarDP}/pkgs"
##__  prjTagsDP="${q_prjEtcDP}/tagsdir"

#--------- prj-w1/t1/dnts/...DIRs global for all prjs : ---------------
q_SW1dntsDP=${dntsDP}/${q_SW1Tag}${q_Label1dnts}           ##-I-SW1-dnts
q_SW1dresDP=${dresCodecsDP}/${q_SW1Tag}${q_Label1dres}           ##-I-SW1-codecs1_dres_1coll
q_SW1dres1kkDP=${dresCodecsDP}/${q_SW1Tag}${q_Label1dres1kk}    ##-I-SW1-codecs1_dres_1coll
q_SW1DocsDP=${dcItDP}/${q_SW1Tag}_dc     ##-I-SW1-w1_docs
q_SW1DocsvarDP="${docsvarDP}/${q_SW1Tag}_docsvar"
q_SW1DWsDP="${dwsvarDP}/${q_SW1Tag}_DWs"        ##-I-apps1-Downloads/t1_lag/packs_DWs/ISOs/big-PKGs/...

#--------- shell-vars-globally: 
pathaddend  ${q_prjBinDP}  ##-??- maybe better in prjEnv-file, due to order of path.entries??


##========== post-aliases-prjX: =========================================
alias cdprj0='cd ${q_prj0DP} && ll && pwd'

##----- aliasas-prj-dir: -----------------------------------------
alias  cdprj='cdlla      ${q_prjDP}'
alias  cdprjbin='cdlla   ${q_prjBinDP}'
alias  cdprjcode1='cdlla   ${q_prjCode1DP}'
alias  cdprjdnts='cdlla   ${q_prjDntsDP}'
alias  cdprjetc='cdlla   ${q_prjEtcDP}'
alias  cdprjpkg='cdlla   ${q_prjPkgsDP}'
alias  cdprjsprof='cdlla   ${q_prjsProfDP}'
alias  cdprjvar='cdlla   ${q_prjVarDP}'
alias  cdprjtests='cdlla ${q_prjTestsDP}'
alias  cdprjwks='cdlla   ${q_prjWksDP}'
alias  cdprjwp='cdlla   ${q_prjWadsDP}'

##----- aliasas-prj-w1/dnts/docs/t1/... --------------------------
alias  cdsw1dnts='cdlla  ${q_SW1dntsDP}/'
alias  cdsw1dres1kk='cdlla  ${q_SW1dres1kkDP}'
alias  cdsw1docs='cdlla  ${q_SW1DocsDP}'
alias  cdsw1docsvar='cdlla  ${q_SW1DocsvarDP}'
alias  visw1dnts='cd  ${q_SW1dntsDP}/  && gvim -c "set titlestring=${prjTag}" *.md *.txt'
alias  viprjprofs="vi1  $q_prjProfPosFP  $q_prjProfFP"
##-- alias viprjcases='cd  ${prjCasesDP}     &&  gvim -c "set titlestring=cases-dnts" *'
##-- alias viprjdnts='cd  ${prjdntsDP}         &&  gvim -c "set titlestring=${prjID}-dnts" *.txt'

##----- aliasas-prj-terms1/apps....: -----------------------------
##__  alias  prjterms1="XDG_CONFIG_HOME=~/.config/00xdg2/  xfce4-terminal  --disable-server  --default-working-directory=${prjTestsDP}  --tab --working-directory=${SW1dntsDP}  --tab --working-directory=${prjWksDP}  --tab --working-directory=${prjWksDP}  --tab --working-directory=${prjTestsDP}  --tab --working-directory=${prjTestsDP}  --tab --working-directory=${prjTestsDP}"
alias  prjterms1="xfce4-terminal  --disable-server --geometry  120x62  --default-working-directory=${q_prjWksDP}  --tab  --active-tab  --tab  --tab  --tab --working-directory=${q_prjDP}  --tab --working-directory=${q_prjWksDP}  --tab --working-directory=${q_SW1DocsDP}  --tab --working-directory=${q_SW1dres1kkDP}  --tab --working-directory=${q_SW1dntsDP}  &"

##========== prjXProfPos (after all prj-global-settings in  in prj0prof):
[[ $prjID_active1  &&  -r ${q_prjProfPosFP} ]]  &&  source ${q_prjProfPosFP} ;

##__}

q_ple1  "${BASH_SOURCE[0]##*/}"       #q_ple1  "$myname11"

