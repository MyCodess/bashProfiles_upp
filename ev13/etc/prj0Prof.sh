##__  #!/bin/bash
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;

##--2do-!! : ALL Vars q_ prefixing !! also in prjsprofs-dir !! due to switching between prjs!!

#################### PRE-COMMON-all-PRJs: ####################################
:  ${q_prj0DP:="${q_UppDP}/prjs"}         ##--I- real-phys-path-needed??:  ${q_prj0DPReal:="${vaarAuDP}/prjs"}  
:  ${q_prjsProfDP:="${q_EttcDP}/prjsprof"}
##__py-prj:   
:  ${q_prjID_active1:="py1"}    ##--II-set this on-the-terminal-cmdline to your prjID, if wanted in one-terminal to have this prj-env !

################### prjs-part: #############################################
##--USAGE11:  
	##--Either manually/Only-for-certain-Terminals:   q_prjID_active1=py1   sus ;
	##--OR hard-coded here for all evv-terminals, eg:  source  ${q_prjsProfDP}/prjProf_py1.sh  
##-!!-nts_VOCAB:
	##- prj <---> SW1 in VAR-names :  eg: prj... is py1-dirs/... ,and its Software/topic/... is SW1...
	##- whereas eg: py1 is a specific project , but PYTHON is its global.pkg/software

##__
[[ $q_prjID_active1 ]] && { 
:	${q_prjProfFP:="${q_prjsProfDP}/prjProf_${q_prjID_active1}.sh"} ;
: 	${q_prjProfPosFP:="${q_prjsProfDP}/prjProf_${q_prjID_active1}_pos.sh"} ;
	source ${q_prjProfFP} ;  ##--later here at the end  q_prjProfPosFP will be sourced!
}
#################### POST-COMMON-all-PRJs: #################################################################
##========== post-pathes-/vars-prjX valid for all prjX after their prjProf_xxx.sh : =====================
#---------- level.1 : prjX-roots-DPs of PRJ: prj.devel + prjVar + prjPkgs  DIRs/pathes: : --------------
prjDP="${q_prj0DP}/${prjID}"   ##-I- prj.devel/wks-root ##-??- prjTag instead prjNo ??  ##--2Do- wks/devel-dir NOT in vaarAuDP, but hier on vo17 just doing so....
prjVarDP="${vaarAuDP}/${prjID}var"       ##-I- prj.var.root : could be used for several prj.nos !?

#--------- level.2 : prjX-sub-dirs,  : --------------
prjAppsDP="${prjDP}/apps"  ##- as sqls,.pysqls,... : Bez.ok??
prjBM1DP="${prjDP}/bm1_links"
prjBinDP="${prjDP}/bin"
prjCasesDP="${prjDP}/cases"
prjDocsDP="${prjDP}/docs"
prjEtcDP="${prjDP}/etc"
prjFuncsDP="${prjBinDP}/funcs"
prjLibsDP="${prjDP}/libs"
prjTestsDP="${prjDP}/tests"
prjTmpDP="${prjDP}/tmp"
prjUtilsDP="${prjDP}/utils"
prjWksDP="${prjDP}/wks"

#--------- level.3+: prjX-var-sub-dirs : --------------------------
prjUnpDP="${prjVarDP}/unp"
prjPkgsDP="${prjVarDP}/pkgs"
##__  prjTagsDP="${prjEtcDP}/tagsdir"

#--------- prj-w1/t1/dnts/...DIRs global for all prjs : ---------------
SW1dntsDP=${dntsDP}/${prjTag}${q_Label1dnts}           ##-I-SW1-dnts
SW1dresDP=${dresCodecsDP}/${prjTag}${q_Label1dres}           ##-I-SW1-codecs1_dres_1coll
SW1dres1kkDP=${dresCodecsDP}/${prjTag}${q_Label1dres1kk}    ##-I-SW1-codecs1_dres_1coll
SW1DocsDP=${dcItDP}/${SW1Tag}_dc     ##-I-SW1-w1_docs
SW1DocsvarDP="${docsvarDP}/${SW1Tag}_docsvar"
SW1DWsDP="${dwsvarDP}/${SW1Tag}_DWs"        ##-I-APPS1-Downloads/t1_lag/packs_DWs/ISOs/big-PKGs/...

#--------- shell-vars-globally: 
pathaddend  ${prjBinDP}  ##-??- maybe better in prjEnv-file, due to order of path.entries??


##========== post-aliases-prjX: =========================================
alias cdprj0='cd ${q_prj0DP} && ll && pwd'

##----- aliasas-prj-dir: -----------------------------------------
alias  cdprj='cdlla      ${prjDP}'
alias  cdprjbin='cdlla   ${prjBinDP}'
alias  cdprjtests='cdlla ${prjTestsDP}'
alias  cdprjwks='cdlla   ${prjWksDP}'
alias  cdprjvar='cdlla   ${prjVarDP}'
alias  cdprjpkg='cdlla   ${prjPkgsDP}'

##----- aliasas-prj-w1/dnts/docs/t1/... --------------------------
alias  cdsw1dnts='cdlla  ${SW1dntsDP}/'
alias  cdsw1dres1kk='cdlla  ${SW1dres1kkDP}'
alias  cdsw1docs='cdlla  ${SW1DocsDP}'
alias  cdsw1docsvar='cdlla  ${SW1DocsvarDP}'
alias  visw1dnts='cd  ${SW1dntsDP}/  && gvim -c "set titlestring=${prjTag}" *.txt'
##-- alias viprjcases='cd  ${prjCasesDP}     &&  gvim -c "set titlestring=cases-dnts" *'
##-- alias viprjdnts='cd  ${prjdntsDP}         &&  gvim -c "set titlestring=${prjID}-dnts" *.txt'

##----- aliasas-prj-terms1/apps....: -----------------------------
##__  alias  prjterms1="XDG_CONFIG_HOME=~/.config/00xdg2/  xfce4-terminal  --disable-server  --default-working-directory=${prjTestsDP}  --tab --working-directory=${SW1dntsDP}  --tab --working-directory=${prjWksDP}  --tab --working-directory=${prjWksDP}  --tab --working-directory=${prjTestsDP}  --tab --working-directory=${prjTestsDP}  --tab --working-directory=${prjTestsDP}"
alias  prjterms1="xfce4-terminal  --disable-server --geometry  120x62  --default-working-directory=${prjWksDP}  --tab  --active-tab  --tab  --tab  --tab --working-directory=${prjDP}  --tab --working-directory=${prjWksDP}  --tab --working-directory=${SW1DocsDP}  --tab --working-directory=${SW1dres1kkDP}  --tab --working-directory=${SW1dntsDP}  &"

##========== prjXProfPos (after all prj-global-settings in  in prj0prof):
[[ $q_prjID_active1  &&  -r ${q_prjProfPosFP} ]]  &&  source ${q_prjProfPosFP} ;

##__}

q_ple1  "${BASH_SOURCE[0]##*/}"       #q_ple1  "$myname11"

