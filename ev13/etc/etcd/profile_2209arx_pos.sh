##__  #!/bin/bash
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; psl  "$myname11" ;

##========================== pos_pathes.sh-syys-VARs  : ==================================
##-- syysPkgs  : from cu OS/system managed pkgs-DIRs ...., now for arx1 :
osPkgsCacheDP="/var/cache/pacman/"
osPkgsLibsDP="/var/lib/pacman/"

##========================== pos_pathes.sh-syys-profs : ==================================
##-------- OSs / syys :
alias vipacs="vi1 -o  /etc/pacman.conf  /etc/pacman.d/${q_Label1qq}mirrorlist  /etc/pacman.d/mirrorlist " ;  ##--/OR:   alias vipac="vi  /etc/pacman.conf" alias vimirror="vi  /etc/pacman.d/mirrorlist"
alias sc1='sudo systemctl status   pcscd.service   pcscd.socket'   #-smartcard/pki-start
##--------
##__ alias  a1terms1="XDG_CONFIG_HOME=~/.config/00xdg2/  xfce4-terminal  --disable-server  --tab --working-directory=${q_BinDP}  --tab  --working-directory=${syys_dnts_DP}  --tab --working-directory=${lxdntsDP}  --tab  --working-directory=${syys_wk_DP}  --tab --working-directory=${syysVarDP}  --tab --working-directory=${q_syysTgDP}  --tab  --working-directory=${vaarAuTestsDP} &"
##__ alias  a2terms1="XDG_CONFIG_HOME=~/.config/00xdg3/  xfce4-terminal  --disable-server  --tab --working-directory=${q_BinDP}  --tab  --working-directory=${TP1DP}  --tab --working-directory=${syysLocReposDP}  --tab  --working-directory=${syysLocReposDP}  --tab --working-directory=${tosoDP} &"

q_ple1  "${BASH_SOURCE[0]##*/}"
