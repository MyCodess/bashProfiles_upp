
##--I- backing up $1 to $2 with timinig + logfile-timestampFile

USAGE1="USAGE: ${0##*/}  <sourceDir>  <targetDir>"
sourceDP="$1"
targetDP="${2:?$USAGE1}"
timestamp_FN="$($cudts).cp.tstmp.flg.txt"
timestamp_FP="${targetDP}/${timestamp_FN}"


cd ${targetDP} || exit 3  ; cd -

echo "====== see ALL output+Error to the output-log-file: ${timestamp_FP}"
exec 1>>${timestamp_FP} 2>&1

echo "--- Source-Sizes:"
cd ${sourceDP} && df -h . ; cd -
du -sm ${sourceDP}
du -sm ${sourceDP}/*

echo "========= Start Copying ${sourceDP} TO: ${targetDP} at: $(date)"

cp -a  ${sourceDP}   ${targetDP}/

echo "================== END Copying ${sourceDP} TO: ${targetDP} at: $(date)"

