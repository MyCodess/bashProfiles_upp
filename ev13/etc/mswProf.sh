##__  #!/bin/bash
##--Abbrev:  mss == ms-in-evv
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;

#####  ==========  basics for both CYG + WSLs + MSYS2 + .... : ######################################
shopt  -s  nocaseglob     ##--path completion/handling case-INsensitve on mswins!  filenames in a case-insensitive fashion when performing pathname expansion!
#--??-  shopt  -s  nocasematch  ##--??- bash  matches  patterns in a case-insensitive fashion when performing matching while executing case or if conditions, or  pattern substitution word expansions, or when filtering ... ! see man bash! dangrours for scripts/cmds/... !!
export  HISTFILE="/var/tmp/tmpu/.hs1_ev1"   ##--will be overwriteen in hostProf!  here as general-/default-setting for msw-syys !
q_Cmp="/c"  ##-- C:-mountpoint in msys/cyg/... ; in WLS was /mnt/c but changed in /etc/wsl.conf and set root=/ instead root=/mnt !
##________________________________________  ___________________________


#####  ==========  HOME/USER-msw:
##----- HOME + USER + ... basics-OS (pre calling any profs! the rest in ms-prof !):
export  USER=${USERNAME:-"userXX"}
export  HOMEW=${USERPROFILE}     ##--prev: OK1-in-msw-format:  export HOME="${HOMEDRIVE}/${HOMEPATH}"
export  HOMEW_cyg="$(cygpath $USERPROFILE )"
##--??:  export  HOME="${HOMEW_cyg}"
alias sethomew='export   HOME=$HOMEW'   ##== ${USERPROFILE}'
alias sethomewcyg='export   HOME=$HOMEW_cyg'
alias cdhm='cdlla   ${HOMEW_cyg}'  ##--cd-home-msw / $USERPROFILE
##__ if-liked-set-also-prjid-here:   export  prjID_active1=ofc1
alias  sort1='LANG=C.UTF-8 sort'  ##-I-for case-SEnsitive-sorting on msw! works also LANG=C , LANG_ALL=C ...
###________________________________________  ___________________________


#####  ==========  main-/root-pathes-msw-defaults
progs2_DP="${q_Cmp}/Progs2"
opptuDP="${progs2_DP}"   ##--II-basically it is sufficient/better that /up1/optu -> .../Progs2 , but so in this way could work also without the link! for now BOTH: here env and link there!
ptb0_DP="${progs2_DP}/0ptb"
###________________________________________  ___________________________


#####  ==========  SWs-defaults-msw, pathes,...:
##---  SWs-main-pathes:
vimruntimeMSsDP="${progs2_DP}/Vim/vim90" ; vimMSsExeFP="${vimruntimeMSsDP}/vim.exe" ; gvimMSsExeFP="${vimruntimeMSsDP}/gvim.exe"
git1_DP="${progs2_DP}/Git" ; git1cmd_DP="${git1_DP}/cmd" ; q_gitPromptFP=${git1_DP}/etc/profile.d/git-prompt.sh ; WINELOADERNOEXEC="" ; pathaddend "${git1cmd_DP}/" ##__ setGitPrompt1
q_pyyHome1_DP="${progs2_DP}/Py3" ; q_pyyHome1Lib_DP="${q_pyyHome1_DP}/Lib" ; q_pyyHome1Scripts_DP="${q_pyyHome1_DP}/Scripts" ; q_pyyexe="${q_pyyHome1_DP}/python.exe"   ##--py--mswin-installed-in-lxpath-format
wt_DP="${ptb0_DP}/wt" ; wt_FP="${wt_DP}/wt.exe"
vscode_DP="${progs2_DP}/VSCode/"
 
##---  SWs-path-addies:
#__ msw-vim:  pathaddvor  "${vimruntimeMSsDP}/"   ##--??-ok??  really not needed, but just to avoid calling MSYS/cygwin-own-vim !
pathaddvor  "${q_pyyHome1_DP}/" ;
pathaddvor  "${q_pyyHome1Scripts_DP}/" ;
pathaddend  "${wt_DP}/"
##--?-if-req.:   pathaddend  "${ptb0_DP}/Graphviz/bin/"

##---  MariaDB/MySql-devvdi1-msw (on mswin-devvdi1):
mariadb_RP="${progs2_DP}/mariadb"
mariadb_bin_DP="${mariadb_RP}/bin"
pathaddend  "${mariadb_bin_DP}/"

##---  SWs-aliases/funcs/...:
alias  vscode1="${vscode_DP}/Code.exe  .  &"
##__OK1-git-prompt     : q_gitPromptFP=${q_EttcD_DP}/git-prompt_msw1.sh ; set +u ; [[ -r  $q_gitPromptFP        ]]  &&  source  $q_gitPromptFP ; set -u ;  ##--must be executed before setting PS1 or evv-profiles ! it overwrites the evv-PS1 otherwise !
##________________________________________  ___________________________


#####  ==========  evv-adapts/settings/...:
syys_dnts_DP="$mssdntsDP"
###________________________________________  ___________________________


#####  ==========  OSs-addies/adapts/...:
unalias psg ; alias psg="ps | grepi" ; alias psgw="ps -W | grepi";
###________________________________________  ___________________________


#####  ==========  WSL or CYG/MSYS is the cu-system ??:
q_mswCyg=0 ; q_mswWsl=0
[[ $q_uname1infs =~ "MICROSOFT-STANDARD-WSL" ]] && q_mswWsl=1 || q_mswCyg=1
###________________________________________  ___________________________


#####  ==========  CYG-systems (msys/cyg/...), so NOT-WSL-systems : ##########################
[[ $q_mswCyg > 0 ]] && {
	bind -f ${INPUTRC_mswin1}
	HOME="$(cygpath $HOME)"
	##-- vims-msys/cyg: in cyg the vim-envars are NOT interpreted correctly, due to path-formats! so must use -u/-U ... :
	##__OK1: vi1()  { "$vimMSsExeFP"   -u "$vimrcFP"  -U "$gvimrcFP"  "$@" ; } ; 	gvi1() { "$gvimMSsExeFP"  -u "$vimrcFP"  -U "$gvimrcFP"  "$@" & }
	vimrcFP=${q_EttcDP}/msw_vimrc
	gvimrcFP=${q_EttcDP}/msw_gvimrc
	vim_cmd1="$vimMSsExeFP   -u $vimrcFP  -U $gvimrcFP"
	alias vim="$vim_cmd1"
	gvim(){ "$gvimMSsExeFP"  -u "$vimrcFP"  -U "$gvimrcFP" $@ & }
	#__OK1: alias gvim='"$gvimMSsExeFP"  -u "$vimrcFP"  -U "$gvimrcFP"'  ##--I-leave them as alias, not-func, to be able to call the orgs with 'gvim' ....
	##--- aliases:
	#--1ok:  alias vit1="wt  -w vi_t1 new-tab  -p myst1  --title vit1 -l -d . -c $vim_cmd1"
	#__1ok: te1_vi(){ wt  -w VI_1 new-tab  --tabColor "#D2B5FF"  -p myst1  --title VI_1 -l -d . -c $vim_cmd1 --servername VI_1 $@ ; }  ##--vim-terminal-multi-files , instead grim -p ;  --title ${1##*/} 
	#__1ok: te1_vi(){ wt  -w $vi_SN1 new-tab  --tabColor "#D2B5FF"  -p myst1  --title $vi_SN1 -d $q_prjDntsDP ; }  ##--vim-terminal-multi-files , instead grim -p ;  --title ${1##*/} 
	te1Tab_vi(){ usage11="open a terminal-tab for vim session: ... [path  [vim-session-id]]" ; wt  -w ${2:-$vi_SN1}  new-tab  --tabColor "#D2B5FF"  -p myst1  --title ${2:-$vi_SN1}  -d ${1:-$q_prjDntsDP} ; }  ##--open just a new normal terminal-tab (colored tab) for vim-sessions (colored-tabs) instead grim -p ...
	te1_vi(){ te1Tab_vi "$@" ; te1Tab_vi "$@" ; te1Tab_vi "$@" ;} ##-open a terminal with tabs for vim-sessions (instead gvim; just normal taerminal with colored tabs ,...)
	alias  psg='ps -alW | grepi'   ##--I- ps cmd of MSYS2 !
	##--- funcs...:
	wp1() { echo "pathes-mswin+unix of Param1 and cu-dir:" ; cygpath --windows $PWD "$@" ; cygpath  --unix  $PWD  "$@" ; }   ##--Windows-unix-Pathes-of-PWD + $1
}
##________________________________________  ___________________________


#####  ==========  WSL-systems (ubuntu, oracle, ... M_Lx): ####################################
[[ $q_mswWsl > 0 ]] && {
	q_mswWsl=1
	alias  vi1="$vimMSsExeFP"  gvi1="$gvimMSsExeFP"  ##--the vim-envvars are correctlxy interpreted!
	##--if-required/org:   q_Cmp="/mnt/c"  ##-- C:-mountpoint in msys/cyg/...
}
##________________________________________  ___________________________


q_ple1  "${BASH_SOURCE[0]##*/}"       #q_ple1  "$myname11"
#################################################################################################



: <<'COMMENTS11'
##############################  OKs-prev ... :  #################################################

#####  ==========  aliases for all mswins (also both cyg/WSL/...):
#_ alias  vi1=vimm  vim1=vimm  gvim1=gvimm
#_ alias  vi=vi1    vim=vim1   gvim=gvim1  view="vim1 -R"  ##--??-needed? after setting the PATH above??:  
###________________________________________  ___________________________

#####  ==========  VIMs-MSs[-ofc1]-dnts:
##--II-win-installed-vims require the pathes in win-format /OR at least winpath with "/" !! with ux-format does NOT work! :
##--!!- this vim.exe does NOT work with -g !! must call extra gvim !! are two different exe on mswins!!
##--!!- in cyg/MSYS the vim-envvars are NOT taken correctly (path-format)! but in WLS are  vim-envvars correctly interpreted!
##--!!- calling with envvars GVIMINIT="source /c/Users/..." did NOT work, at least with / format! so must call with -u ! then works with / format !
##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
##--OK1:  alias vi=vimm  vim=vimm  gvim=gvimm  view="vimm -R"  vi1=vimm  vim1=vimm  ##--??-needed? after setting the PATH above??:  
##________________________________________  ___________________________

#####  ==========  1OKs_prevs...:
##--- vim-stuff on mswin:
#-!! vim--einheitlicher vim-dir for all cyg/git/mswin terminals, did NOT work, due to path-formats-win-lx!: vim_exe_DP="/c/Progs2/Vim/vim90" ; export  PATH="$vim_exe_DP":$PATH
##--OK1-for-BUT-only-second-vimrc-is-executed:  alias  gvim1='/c/Progs2/Vim/vim90/gvim.exe  -u "C:\Users\DKX8H1N\ofc1\etc\vimrc" -u  "C:\Users\DKX8H1N\ofc1\etc\vimrc_up1"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
##--I-now-in-ofc1-profs:   alias      vim1='/c/Progs2/Vim/vim90/vim.exe    -u "C:\Users\DKX8H1N\ofc1\etc\vimrc"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
## use vim1 -g instead! : alias     gvim1='/c/Progs2/Vim/vim90/gvim.exe   -u "C:\Users\DKX8H1N\ofc1\etc\vimrc"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
## use vim1 -d instead! : alias  vimdiff1='/c/Progs2/Vim/vim90/vim.exe -d -u "C:\Users\DKX8H1N\ofc1\etc\vimrc"  -U "C:\Users\DKX8H1N\ofc1\etc\gvimrc"'  ##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
##-----.....

##---msys/cyg/ms-shells...:
##--OK1--only-mswin--only-PWD:  alias  wp1='cygpath --windows $PWD'   ##--Windows-Path-of-pwd
##-----.....
###________________________________________  ___________________________


############################## olds/prev/hists/colls/....: #######################################
#####  ==========  olds/prev/hists/...
###________________________________________  ___________________________
COMMENTS11

