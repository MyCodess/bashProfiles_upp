##__  #!/bin/bash
#-- DIRs, Pathes,...globally defined; not depend on user-ENV (as DB-data,...), so once only in prof.; otherwise in ENV-scripts _______
#--I- !! only dependents DIRs here; for roots-/firt-level-pathes see const.sh !!
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;
set -a

##============= Etc: user-etc-dirs: ======================
#-- user-dirs: etc+var+...:
ettcUser="${ettcuDP}/etc${USER}"
vaarUser="${vaaruDP}/var${USER}"

##============= basic-start/root-dirs: evv+users  ===========================
#-- evv.main-direct-SUBdirs:
q_FuncsDP="${q_BinDP}/funcs"
q_SkelDP="${q_EttcDP}/skels"

#============= evv-media1,mnts,..., more mnt/medias :
q_Med1DN="MED1_RF"
q_Med1DP="${q_MediasDP}/${q_Med1DN}"

#============= evv-bups1-pathes/files:
q_NobupFlagTplFP="${q_SkelDP}/NoBup1_template.flg.u8"   #--i-put the flag in cache/tmp/...-DIRs, to exclude from bup/tar. must be utf-8, see http://www.brynosaurus.com/cachedir/spec.html ; by copying to the target dir, it MUST be renamed to $q_NoBupFlagFN
#-- bups1_Loc_Partition/Loc_HDD/INTernal_Media and pathes , so first-buppings:
q_Bups1LocMed1RDN=HDD11
q_Bups1LocMed1RTDP=${q_MediasDP}/${q_Bups1LocMed1RDN}
#-- bups1-EXT-Media , so bupping from INT-bups1 to EXT-Media:
q_Bups1Med1DN="BUPS1MD1"
q_Bups1Med1DP="${q_MediasDP}/${q_Bups1Med1DN}"
#-- bups1_Loc-pathes/DIRs:
vaarAuBups1_P="${vaarAuDP}/bups11_P"
vaarAuBups1DP="${vaarAuBups1_P}/bupsvar1"
vaarAuBups2DP="${vaarAuBups1_P}/bupsvar2"

#============= /t1-main-subDirs, 1.levels
t1varDP="${TP1DP}/t1var"
docsvarDP="${t1varDP}/docsvar"
dwsvarDP="${t1varDP}/DWsvar"
##--obsl, replace by t1var :  lagDP="${TP1DP}/lag"
npsDP="${TP1DP}/nps"
packsDP="${TP1DP}/packs"
syysDP="${TP1DP}/sy1"     #--i- syys-DP , contains q_syysTg-stat/bups/...
trDP="${TP1DP}/tr"

##============= /t1: subDirs 2/3-levels:
tosoDP="${npsDP}/2So"     ##-II- 2soDP does NOT work, due to bash-naming-rules for env.vars! var-name can NOT begin with num!
nps2DP="${npsDP}/0nps2"
npshddDP="${q_Bups1LocMed1RTDP}/T1_Loc/nps"

##============= vaarAu-dirs; all.users.VAR-dirs for curr works: ALL-Users / Share-Vars : ===============
#-- evv.vars/spoolings (here using vaarAuDP, but could be HOME/..):
vaarAuAppsDP="${vaarAuDP}/appsvar"  ##--ofc-
vaarAuLogDP="${vaarAuDP}/log"
vaarAuOldsDP="${vaarAuDP}/olds"
vaarAuSyysDP="${vaarAuDP}/syysvar"            # for syys stuff as rpmlists,...
vaarAuTestsDP="${vaarAuDP}/tsts"
vaarAuSpoolDP="${vaarAuDP}/spool"
vaarAuTmpDP="${vaarAuDP}/tmp"
vaarAuUnpDP="${vaarAuDP}/unp"
vaarAuWorksDP="${vaarAuDP}/wks"
##================ __1END__ varau/... ==================


##============== apps-/syys-/xwin/xdg/HOME-configs-...:
#----- VIMs:
vimsrcRTDP="${q_EttcDP}"          ##--II- exception form VIMs + inputrc !! all other apps-etc-stuff in /up1/etcu/etcau , 1apps-etc , ...
vimrcFP="${vimsrcRTDP}/vimrc"
gvimrcFP="${vimsrcRTDP}/gvimrc"
VIMINIT="source  ${vimrcFP}"
GVIMINIT="source ${gvimrcFP}"
#----- BM1s : FileMagms/IntBM/...:  !!---> MUST be always adapted to the cu FileMgm/Int-Browser-BMs!! :
#-FilesMgm-cu:  Thunar/Nemo/Files-ubt/_190600 :
filesBM1_FN="bookmarks"
filesBM1_FP="${HOME}/.config/gtk-3.0/${filesBM1_FN}"  ##--Files-Bookmark1-FilePath-evv of the curren Files-Browser/Explorer; for now BM-file of nemo/thunar/nautilusin Gnome-3
#-IntBrowser-cu:  Vivaldi/_190600 :
IntBM1_FN="Bookmarks"
IntBM1_FP="${HOME}/.config/vivaldi/Default/${IntBM1_FN}"  ##--Int-Bookmarks1-FilePath-evv, for now of vivaldi
#-IntBrowser-cu:  Vivaldi/_190600 :
IntBM2_FN="Bookmarks"
IntBM2_FP="${HOME}/.config/chromium/Default/${IntBM2_FN}"  ##--Int-Bookmarks2-FilePath-evv, for now of chromium

##============= w1-tree/DIRs =============================================================
#----- w1-root-dirs1 : -----
dc1kDP="${w1DP}/dc1K"    ##--prev:  w1/docs_m
dcAlDP="${w1DP}/dcAL"    ##--prev:  w1/docs_noIT
dcItDP="${w1DP}/dcIT"    ##--prev:  w1/docs
#----- w1-dc1k: --------------
infs1kkDP="${dc1kDP}/Infs1_1kk"
devcDocsDP="${dc1kDP}/Devc-Docs"
ProgsResW1DP="${dc1kDP}/ProgsRes_CP"
#----- w1-Devels/ITs : -----------------
dresDP="${dc1kDP}/dres"
dresCodecsDP="${dresDP}/codecs1${q_Label1dres}"
dntsDP="${dresDP}/dnts"

#-
lxCmdsdntsDP="${dntsDP}/lxCmds_dnts"
lxOSsdntsDP="${dntsDP}/lxOSs_dnts"
lxSHsdntsDP="${dntsDP}/lxSHs_dnts"
lxOSDocsDP="${dcItDP}/LxOSs_dc"

#-
gitsdntsFP="${dntsDP}/devops-buildConfMgm_dnts/gities/gits_dnts.txt"
vimsdntsFP="${lxCmdsdntsDP}/vims_dnts.txt"

#- mss
mssdntsDP="${dntsDP}/msw_dnts"
mssshellsdntsDP="${mssdntsDP}/ps1_wt_dnts"

#----- w1-WPads : ----------------------
wpsRTDP="${dc1kDP}/WPads_All"
wpDP="${wpsRTDP}/WPad"
wpFP="${wpDP}/wpad.txt"
caps1FP="${wpDP}/caps1.txt"

#----- w1-L1NWs: -----------------------
l1nwdntsDP="${dc1kDP}/L1NWs"
l1nwStatsDP="${l1nwdntsDP}/l1nw_stats_confs_1nts"
l1nwBupsLogsFlagsDP="${l1nwStatsDP}/BupsLogsStats_l1nw"
##============= __1END__ w1-tree/DIRs =============================================================

##========== q_syysTg/syys-dirs valid for ALL-syys based on q_syysTg,... ,otherwise in its own syys-hostglob-profs! (hostglob-profile-pos basically) ,subDirs 2/3-levels: =======
##----- syys_nps/packs/cd/...:
syysNPsDP="${npsDP}/${q_osTg}_nps"
syysPacksDP="${packsDP}/${q_osTg}_pk"
syysCDDP="${packsDP}/${q_osTg}_cd"
##----- q_syysTg_vars:
syysVarDP="${vaarAuDP}/${q_osTg}var"       ##-I- could be set to ${q_syysTg}var if needed paralle same syys-vars !
syysVarUnpDP="${syysVarDP}/unp"
syysLocReposDP="${syysVarDP}/repos1"  ##--could be also in syysPacksDP in t1 but on arx could not be on exfat, but on ext4! so here!
#------ q_syysTg-docs/dnts/... in w1/t1 ...:
syys_dnts_DP="${lxOSsdntsDP}/${q_osTg}${q_Label1dnts}"
syys_nps_DN="${q_osTg}_nps"
syys_wk_DP="${vaarAuWorksDP}/${q_osTg}_wk1"
syys_dc_DP="${lxOSDocsDP}/${q_osTg}_dc/"
##----- q_syysTg_stats_athes:
: ${q_syysTgDP:="${syysDP}/${q_syysTg}"}
syysTgBupsDP="${q_syysTgDP}/bups"
syysTgLogsDP="${q_syysTgDP}/logs"
syysTgStatsDP="${q_syysTgDP}/stat_${q_syysTg}"
syysTgStatsConfigsDP="${syysTgStatsDP}/configs"
syysTgStats_dntsFP="${syysTgStatsDP}/stat1_${q_syysTg}.txt"   ##--II-mainly only log-collects of syystg-stat by scrit!
syysTgStatsLogFP="${syysTgStatsDP}/stat1_${q_syysTg}.txt.log"   ##--II-mainly only log-collects of syystg-stat by scrit!
syysTgSetupdntsFP="${syysTgStatsDP}/setup1_${q_syysTg}${q_Label1dnts}.txt"
syysTgTrDP="${trDP}/${q_syysTg}_tr"


##============= MVPs: ====================================================================
##--II-now MPs separate VPs:  for now MPs seperately from MVPs/VPs, due to usb128-stick! so now: MPs-rootDir not under MVPs-root !
##-- MVPs : ---> 2chk! for MVPs/VPs not-tested yet! if MVPs not on its own media (as now on tx_BP), then re-link its pathes in /up1/media/ instead changing the pathes here, so to be similar to MPs-stuff here!
##----------- MVPs / VPs : -----------
mvpsMed1DN="MVPs_RF"
mvpsMed1DP="${q_MediasDP}/${mvpsMed1DN}"
mvpsDP="${mvpsMed1DP}/MVPs_All_RF"
##-- VPs:
vpsDP="${mvpsDP}/VPs_All"
##----------- MPs: -------------------
##-- MPs-med1:
mpsMed1DN="MPs_RF"
mpsMed1DP="${q_MediasDP}/${mpsMed1DN}"
##-- MPs-pathes:
mpsDP="${mpsMed1DP}/MPs_All_RF"
mps1DP="${mpsDP}/MPs1"
mpsADP="${mps1DP}/MPAs"
mpswpDP="${wpsRTDP}/MPs_wk"
##--mpsG0 / mpsNPs:
mpsNps1DP="${nps2DP}/MPs_nps1"  ##--2do?: parentDir as envvar?? due to fat-part no links possible! otherwise:  ${npsDP}/MPs_nps1
mpsG0RTDP="${mpsNps1DP}/MPAs_G0_All"  ##--old-/:241216-on-HP13-HDD:  "${npshddDP}/MPAs_G0_All"   ##--II-moved-from here to HP13-HDD, was on:   "${mpsDP}/MPAs_G0_All"

##======== usbs, medias, extHDs, misc,...:

##======== MEs2/MEs_CPs/abs_CPs/...:
wp_mesCP_DP="${wpDP}/mes-wp"
absDP="${wpDP}/ab1_1kk_1pub_RF"
absFP="${absDP}/peops1_1ab_1kk.txt"
##-- absCP_DP="${wp_mesCP_DP}/abs_CP"


#####  ==========  SWs-main-pathes: =============================================================
###________________________________________  ___________________________
#
q_ple1  "${BASH_SOURCE[0]##*/}"    ##- $q_PathesFN

