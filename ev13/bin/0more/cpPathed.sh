##--I- cp-WITH-keeping-source.relative.Path contained in $1 by copying into the target-dir: esp. for indiviual/single file/dir WITH keeping its tree-structutre in the target-dir:
#   - altern.0)!!  with tar, short, worked-OK-great !!   /_200300  :  tar -cpv <source-dir11/-file11>  |   tar -x  [-C  target-dirRoot11]  ;##  ##--/OR just "| tar -x" if into the cu-dir ! ##--eg:   tar -cpv  /etc/wpa_supplicant/xx.conf  |   tar -C ./dir1/  -x  ;
#	- altern.1) with tar, fully specified-OK! even if wanted only partly-pathCP (not-ful-absolut-path, as by w1_RF to w1_BP):    tar -cpvf -  -C /var/tmp/tempu1/w/BK1s_ITs/BKs_Javas/0_JLang/TIJ_4ed/TIJ4-code/   ./net/mindview/util/TwoTuple.java  | tar -xvf -  -C  $vaaruTestsDP  ##--offc-
#	- altern.2) with rsync /OR cp: ?? obv. nothing there ! _1kk !!??
#	- altern.4) with this script: 

##--2do-b: cosmetics: removing ./ at the beginning of $1 if any, and also diff between dir or file in source $1 by setting $sourceDirPath

USAGE1="===USAGE:  $0  <source-relative-filePath/dirPath>  <target-dir>";
(( $# != 2 ))  && { echo "$USAGE1" ; exit 3 ; }

sourcePath="$1"
targetPath="$2"

sourceDirPath=${1#./}  ##--II- deleting the "./" prefix if there!
sourceDirPath=${sourceDirPath%/*}  ##--II- ONLY DIR-Path without the filename
targetFullPath="${targetPath}/${sourceDirPath}/"

cmd1="mkdir -p  ${targetFullPath}"
cmd2="cp -ixv -a --backup=numbered --strip-trailing-slashes  ${sourcePath}  ${targetFullPath}"

echo -e "== final-cmds:\n  $cmd1 ;\n  $cmd2 ;\n"
read -p "OK?? [ENTER for OK or CTRL-C to cancel]"

$cmd1   &&  $cmd2

