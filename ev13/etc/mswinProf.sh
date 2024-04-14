##__  #!/bin/bash
##--Abbrev:  mss == ms-in-evv
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; q_pls1  "$myname11" ;

#####  ==========  basics for both CYG + WSLs : ######################################
shopt  -s  nocaseglob     ##--case-INsensitve path handling on mswins!
shopt  -s  nocasematch
q_Cmp="/c"  ##-- C:-mountpoint in msys/cyg/... ; in WLS was /mnt/c but changed in /etc/wsl.conf and set root=/ instead root=/mnt !
q_gitPromptFP=${q_EttcD_DP}/git-prompt_msw1.sh
set +u ; [[ -r  $q_gitPromptFP        ]]  &&  source  $q_gitPromptFP ; set -u ;  ##--must be executed before setting PS1 or evv-profiles ! it overwrites the evv-PS1 otherwise !
##________________________________________  ___________________________

#####  ==========  pathes.sh + pathes-aliases... of MSs-Allg /MS-evv/MS-OSs/... (for prj-epecific-pathes-addies see the prj/host-prof!!): 
progs2_DP="${q_Cmp}/Progs2"
vimruntimeMSsDP="${progs2_DP}/Vim/vim90" ; vimMSsExeFP="${vimruntimeMSsDP}/vim.exe" ; gvimMSsExeFP="${vimruntimeMSsDP}/gvim.exe"
syys_dnts_DP="$mssdntsDP"
PATH="${vimruntimeMSsDP}:$PATH"  ##--??-ok??  really not needed, but just to avoid calling MSYS/cygwin-own-vim !
##________________________________________  ___________________________

#####  ==========  WSL or CYG/MSYS is the cu-system ??:
q_mswCyg=0 ; q_mswWsl=0
[[ $q_uname1infs =~ "MICROSOFT-STANDARD-WSL" ]] && q_mswWsl=1 || q_mswCyg=1
###________________________________________  ___________________________

#####  ==========  CYG-systems (msys/cyg/...), so NOT-WSL-systems : ##########################
[[ $q_mswCyg > 0 ]] && {
	bind -f ${INPUTRC_mswin1}
	HOME="$(cygpath $HOME)"
	##-- vims-msys/cyg: in cyg the vim-envars are NOT interpreted correctly, due to path-formats! so must use -u/-U ... :
	vimm()  { "$vimMSsExeFP"   -u "$vimrcFP"  -U "$gvimrcFP"  "$@" ; }
	gvimm() { "$gvimMSsExeFP"  -u "$vimrcFP"  -U "$gvimrcFP"  "$@" & }
	##--- aliases:
	alias  psg='ps -alW | grepi'   ##--I- ps cmd of MSYS2 !
	##--- funcs...:
	wp1() { echo "pathes-mswin+unix of Param1 and cu-dir:" ; cygpath --windows $PWD "$@" ; cygpath  --unix  $PWD  "$@" ; }   ##--Windows-unix-Pathes-of-PWD + $1
}
##________________________________________  ___________________________

#####  ==========  WSL-systems (ubuntu, oracle, ... M_Lx): ####################################
[[ $q_mswWsl > 0 ]] && {
	q_mswWsl=1
	alias  vimm="$vimMSsExeFP"  gvimm="$gvimMSsExeFP"  ##--the vim-envvars are correctlxy interpreted!
	##--if-required/org:   q_Cmp="/mnt/c"  ##-- C:-mountpoint in msys/cyg/...
}
##________________________________________  ___________________________


#####  ==========  aliases both:
alias  vi1=vimm  vim1=vimm  gvim1=gvimm
alias  vi=vi1    vim=vim1   gvim=gvim1  view="vim1 -R"  ##--??-needed? after setting the PATH above??:  
###________________________________________  ___________________________

q_ple1  "${BASH_SOURCE[0]##*/}"       #q_ple1  "$myname11"
#################################################################################################



#####  ==========  VIMs-MSs[-ofc1]-dnts:
##--II-win-installed-vims require the pathes in win-format /OR at least winpath with "/" !! with ux-format does NOT work! :
##--!!- this vim.exe does NOT work with -g !! must call extra gvim !! are two different exe on mswins!!
##--!!- in cyg/MSYS the vim-envvars are NOT taken correctly (path-format)! but in WLS are  vim-envvars correctly interpreted!
##--!!- calling with envvars GVIMINIT="source /c/Users/..." did NOT work, at least with / format! so must call with -u ! then works with / format !
##--due to path-format-misch-maash, the mswin-gvim-install ca not find vimrc-FP with unix-format!
##--OK1:  alias vi=vimm  vim=vimm  gvim=gvimm  view="vimm -R"  vi1=vimm  vim1=vimm  ##--??-needed? after setting the PATH above??:  
##________________________________________  ___________________________


: <<'COMMENTS11'
############################## 1OKs_prevs ...: ###################################################
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
