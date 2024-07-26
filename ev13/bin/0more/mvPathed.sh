##------ 2work-2do ---not-complete: diff between if source is a file or DIR !! maybe with an option-flag as -d or so...
exit 3;

##--I- mv-WITH-keeping-source.relative.Path contained in $1 by copying into the target-dir: esp. for indiviual/single file/dir WITH keeping its tree-structutre in the target-dir:
#	- altern.1) with tar, fully specified-OK:    tar -cf -  -C /var/tmp/tempu1/w/BK1s_ITs/BKs_Javas/0_JLang/TIJ_4ed/TIJ4-code/   ./net/mindview/util/TwoTuple.java  | tar -xvf -  -C  $vaaruTestsDP  ##--offc-
#	- altern.1b) with tar, short, works??:       tar -c  d1/acpi/events/power_button  | tar -C /up1/varu/varau/wks -x
#	- altern.2) with rsync:
#	- altern.3) with cp -uR (bzw.?: -ua) : ...
#	- altern.4) with this script: 

##--2do-b: cosmetics: removing ./ at the beginning of $1 if any, and also diff between dir or file in source $1 by setting $sourceDirPath

USAGE1="===USAGE:  $0  <source-relative-filePath/dirPath>  <target-dir>";
(( $# != 2 ))  && { echo "$USAGE1" ; exit 3 ; }

sourcePath="$1"
targetPath="$2"

sourceDirPath=${1%/*}  ##--II-maybe is not needed anymore with newer cmd-version with the option of  --strip-trailing-slashes
sourceDirPath=${sourceDirPath#./}
targetFullPath="${targetPath}/${sourceDirPath}/"
cmd1="mkdir -p  \"${targetFullPath}\" "
cmd2="mv  -iv   --strip-trailing-slashes  --backup=numbered  \"${sourcePath}\"  \"${targetFullPath}\" "

echo -e "== final-cmds:\n  $cmd1 ;\n  $cmd2 ;\n"
read -p "OK?? [ENTER for OK or CTRL-C to cancel]"

echo mkdir -p "${targetFullPath}" &&  echo $cmd1

