##__  #!/bin/bash
##--          fixed/constant values valid to the whole environment also valid during the whole session (for pathes see extra file, except basic pathes)
set -a      ##--?- if needed backup old set-options: oldSets="$-" ; later: set -"$oldSets" : however this resets ONLY on-cases, BUT does NOT change off-cases!!
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;

##-- very start-vars:
q_versionID=2209	                   # version/releas-number/ID of the whole package of evEnvnv as XX.x.x ; eg.: 0210 == 02.1.0 
declare -xi q_EvvNO=${q_EvvNO:-${q_EvvDPPhys: -2}} ;   #curr env-ID resp. dir-suff-ID, last two digits of root-dir-name are the curr-env-identifier too!


##========== syys-Tags/OS-tags for syys-dirs/L1NW-PCs,... =========================================================
##--- below only "formal"-syys-values and their dafult-puts-togethers! the right/finale ones in  $q_HostGlobProfFP ! system-dependent/canging/varying-vars of syys are defined in the $q_HostGlobProfFP !
: ${q_osRelTg:=NNN}   #- OS-longname: distro.ver.arch
: ${q_osTg:=NNN}          #- OS-short-abbrev-name : used for syysTg...
: ${q_diskTg:=NNN}      #- OS-DiskX.PartX : used for syysTg...
: ${q_syysNoTg:=NNN}      #- my assigned No, Unique-Identifies of System.on.Disk: teke YYMM for _RF-system and then go randomly BACKWARDS/lowers for _CP-systems: so Unique+Lower.than.its.RF, could be random.
: ${q_syysCatTg:=NN}       #- choice: RF, CP, TE (testie), DV (developing), DM (dummy ;)just flag, not used yet. set this in RF-system to RF in globhost-file; 
##--- assemblying fix-syys-vars, as defaults in case that not done in hostglob-prole, based on setting in  $q_HostGlobProfFP :
: ${q_hostTg:=${q_Hostname}_${q_diskTg}}
: ${q_syysTg=${q_syysNoTg}${q_osTg}}                     #--!- final Evv-syysTagIdentifier-short-version--default: identifying current os+host-tags ! curr-syys-host-identifier-tag !
: ${q_syysTgL1=${q_syysTg}_${q_Hostname}}    #--!- final Evv-syysTagIdentifier-long1-version--hostName: identifying current os+host-tags ! curr-syys-host-identifier-tag !
: ${q_syysTgL2=${q_syysTg}_${q_hostTg}}         #--!- final Evv-syysTagIdentifier-long1-version--hostTg: identifying current os+host-tags ! curr-syys-host-identifier-tag !


##=========== profiles-FileNames + profiles_FilesPathes-Evv (but use ONLY FilePathes, not FNs): ========================
##-- FNs:  Profiles-FileNames:
q_ConstantsFN=const.sh
q_ProfileFN=profile.sh
q_Profile2PosFN=.profile2_pos.sh
q_PathesFN=pathes.sh
q_prj0ProfFN=prj0Prof.sh
q_AliasesFN=aliases.sh
q_Funcs1FN=funcs1.sh         ##--?- q_LogoutFN=logout.sh
q_Funcs2FN=funcs2.sh         ##--?- q_LogoutFN=logout.sh
q_ProfCu1FN=profCu1.sh         ##--?- q_LogoutFN=logout.sh
q_XWinsProfFN=xwinsProf.sh
q_mswinProfFN=mswProf.sh
q_pyProfFN=pyProf1.sh

##----------- profiles_FilesPathes-Evv --------------------------------
##-- FPs:  Profiles-FilePathes:
q_ConstantsFP=${q_EvvDP}/${q_ConstantsFN}  #--only config file in the root; the rest in etc.
q_ProfileFP=${q_EttcDP}/${q_ProfileFN}         ##--?- q_FuncsProfFP=${q_EttcDP}/${q_FuncsProfFN}    ##--???-neede in bsh??
: ${q_Profile2PosFP:=${HOME}/${q_Profile2PosFN}}
q_PathesFP=${q_EttcDP}/${q_PathesFN}
q_prj0ProfFP=${q_EttcDP}/${q_prj0ProfFN}
q_AliasesFP=${q_EttcDP}/${q_AliasesFN}
q_Funcs1FP=${q_EttcDP}/${q_Funcs1FN}
q_Funcs2FP=${q_EttcDP}/${q_Funcs2FN}    
q_ProfCu1FP=${q_EttcDP}/${q_ProfCu1FN}
q_XWinsProfFP=${q_EttcDP}/${q_XWinsProfFN}
q_mswinProfFP=${q_EttcDP}/${q_mswinProfFN}
q_pyProfFP=${q_EttcDP}/${q_pyProfFN}
##--?- q_LogoutFP=${q_EttcDP}/${q_LogoutFN}


##===========  uppTree which contains links to : w1,t1,t2,varu,optu,etcu,mnt,.... ====================================
##---- first-level-roots of q_UppDP :
w1DP=${q_UppDP}/w1         #--w1_RF     ##--2do-!! Maybe using the the  := default-value-syntax "":= and so rename it to q_w1DP , as:  ${q_w1DP:=${q_UppDP}/w1}  ?? to be able to relocate it not only as link in /up1/ but also per EnvVar!?!? renaming then due to sus1unset !!  
w1DPPhys=$(cd $w1DP && pwd -P)  ##--physica-path-of-w1 for tars,.... !
ettcuDP=${q_UppDP}/etcu     #- var-root for all users, also individual users
vaaruDP=${q_UppDP}/varu     #- var-root for all users, also individual users
opptuDP=${q_UppDP}/optu     #- evv-opt-added, in msw praktisch /c/Progs2/
TP1DP=${q_UppDP}/t1              #- T1-Partition
TP2DP=${q_UppDP}/t2              #- T2-Partition
TP3DP=${q_UppDP}/t3              #- T3-Partition
TP4DP=${q_UppDP}/t4              #- T4-Partition

#-- xxxAuDPs :
ettcAuDP=${ettcuDP}/etcau      #- etc-shared-for-all-users
vaarAuDP=${vaaruDP}/varau      #- var-shared-for-all-users
ostmpdir1DP='/tmp/1dir11/'     #- /tmp/ tr/wks/... stuff in /tmp/ just in case prj/... requires temporary accessible to OS/..., also tempo 1RZ, 1m, ...
ostmpvar1DP='/tmp/1var11/'     #- /tmp/ all auto-files as caches/vars/... as pycache, pytestcache, ...

##-- mounts/medias/devs/.... upp :
q_MntDN=mnt      ##--Evv-mnt-dirN,   so mountPoints.root.DirN for Evv-fixed-mounted-parts
q_MediasDN=media   ##--Evv-media-dirN, so mountPoints.root.DirN for Evv-flexxible-mounted-medias (usb, NW,...)
q_MntDP=${q_UppDP}/mnt      ##--Evv-mnt-dirN,   so mountPoints.root.DirN for Evv-fixed-mounted-parts
q_MediasDP=${q_UppDP}/media   ##--Evv-media-dirN, so mountPoints.root.DirN for Evv-flexxible-mounted-medias (usb, NW,...)

# =========== LABELs1_1kk/TAGs1-1kk/-Evv : 1kk-labales/-flags/-tags/-identifiers/ FN-suffixes /DIRnames-addies/ ... , 1kk-addies ... _RF :
#--- 00-DNs/00-singleDNs-labels1_1kk -------  to be on the TOP ! 00-DN-etikets/IDsconstants/addies/suffixes_1kk bzw _1Evv:(here only 00-DIRs, so the ones generated to be on the TOP !: for the rest, as packs/nps/lag/... see pathes.sh,...
q_Label00DNArcs=00arcs
q_Label00DNMisc=00misc
q_Label00DNOlds=00olds
q_Label00DNOrgs=00orgs
q_Label00DNPrev=00prev
q_Label00DNTmps=00tmps
q_Label00DNTr=00tr
q_Label00DNDir1=00dir1
###--- 00-FNs/00-singleFNs-labels1_1kk -------- (otherwise just take FNs-labels1-tags1 for not-SINGLE-FNs :
q_Label00FNnts="00nts"
#--- DNs-/FNs-Categories--mainCategorieslabels1Suffixes_1kk : -------
q_Label0Cats1RF="_RF"    ##--both _RF-Dir /OR PROD-ENV
q_Label0Cats1BP="_BP"
q_Label0Cats1CP="_CP"
q_Label0Cats1AR="_AR"    ##--II-like _1arc, but more for bigs/DIRs, as similar to _RF,..
#--- ENVs-Categories--Prod/test/Devels/... : -------
q_Label0Cats1PD="_PD"    ##--PROD-ENV, i  but also _RF is ok !
q_Label0Cats1TE="_TE"    ##--TEst-Env,
q_Label0Cats1DV="_DV"    ##--Devel-Env, Entwicklung-Env
###--- FNs-tags1Addies_1kk-labels1 , also in_1kk_nts-tags-addies ALL,  _1xxx : ---------
q_Label1arc="_1arc"
q_Label1aw="_1AW"
q_Label1coll="_1coll"
q_Label1cu="_1cu"
q_Label1dnts="_dnts"
q_Label1dres="_dres"
q_Label1dres1kk="_dres_1kk"
q_Label1kk="_1kk"
q_Label1skk="_1skk"
q_Label1misc="_1misc"
q_Label1nts="_1nts"
q_Label1noTxt="_1noTxt";  ##--scans-PDFs--but-NOT-OCR!! inside-pdf only JPG/PNG/...
q_Label1org="_1org"
q_Label1pdats="_1pdats"
q_Label1postal="_1postal"
q_Label1print="_1print"
q_Label1qq="1q_"        ##--!!prefix-FileNames for by evv created+modifies  config files eg in /etc/....! for org-modifies-files there use only vide-org to flag the org-files!
q_Label1Qky="_1Qky"      ##--quickys-onliners-shorties-...! NOT-1qky due to confusion with "1q_" in evv-filename
q_Label1rz="_1RZ"
q_Label1sammel="_1sammel"
q_Label1scan="_1scan"
q_Label1sig="_1sig"

#--- Flag-FNs
syncFlagFN=0syc.flg.txt
q_NoBupFlagFN=NoBup1_flg.txt  ##-2do- rename t0 NoBup1.flg.txt

#--- timestamp-tags-Evv-formats:
dateForm1="%y%m%d"
dateForm2="%Y%m%d"
dateTimeForm1="%y%m%d-%H%M%S"
dateTimeForm2="%Y%m%d-%H%M%S"
cuds="date +${dateForm1}"
cudts="date +${dateTimeForm1}"
cuds2="date +${dateForm2}"
cudts2="date +${dateTimeForm2}"

#--- text-/dnts-/md-files-Labels (INSIDE the files-texts!! NOT as FN/FP !)
q_fold1Sm="#####  ==========  "   ##folding-START-markierung-main-section-/1 in dnts/md-files : "#5  =10  " , so 19-chars (20-1)  ! see also vimrc !
q_fold1Em="##________________________________________  ___________________________"   ##folding-END-markierung in dnts/md-files : "_40  _27", so 69-chars (70-1) !see also vimrc !
q_fold12Sm="_______:  "   ##folding-START-markierung-sub-section-/2  , end-markierung-for -now-nothing-bzw.-an-emptyline !
# =========== Errors/Logs-tags_RF (mainly used in funcs): ========================================
##----- output-Levels-consts: -------------------
q_fatalErrorLevel=20
q_errorLevel=30
q_warnLevel=40          #--prod-default
q_infoLevel=60          #--working/test-/infoLines-default
q_debugLevel=70         #--devel-/debugging-default
q_currVerboseLevel=${q_currVerboseLevel:-$q_infoLevel}      ##--so default is q_infoLevel (infolines + warns + erros! no detailed debug stuff!)

##----- output-tags-consts: ---------------------
q_fatalErrorTag="====FATAL-ERROR: "
q_errorTag="====ERROR: "
q_warnTag="===WARNING: "
q_infoTag="--- "
q_debugTag="+++ "

#-----  output-tags-consts-more/misc: start-/end-inf-tags/problems/...:
q_Tag1Start="__1STA__"
q_Tag1End="__1END__"
q_problemTag='==!!==Problem: '
q_problemTagCritical="${q_problemTag}-Critical-Level: "

#----- output-Levels <-> output-tags associative-array :
declare  -A  q_logTagsA1
q_logTagsA1["$q_fatalErrorLevel"]="$q_fatalErrorTag"
q_logTagsA1["$q_errorLevel"]="$q_errorTag"
q_logTagsA1["$q_warnLevel"]="$q_warnTag"
q_logTagsA1["$q_infoLevel"]="$q_infoTag"
q_logTagsA1["$q_debugLevel"]="$q_debugTag"
##__  echo "${q_logTagsA1[@]}"
# =========== __1END__ Lables ==========================================================

#####  ==========  misc envvars,...:
###________________________________________  ___________________________


##-- done-flags-if-still-needed: declare -xi  q_XWinsProfDone:=0
q_ple1  "${BASH_SOURCE[0]##*/}"   ##- "$q_ConstantsFN"
