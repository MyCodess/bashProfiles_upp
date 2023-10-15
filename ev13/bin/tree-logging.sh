#!/bin/bash
##-- printing tree+status+sizes+...  of a Dir/Partition/...
##__  set -u

export startDir1="${1:?USAGE:  $0  <start-dir-to-log-trees-and-status>  [more-tree-args/flags, but ALL-as-ONE-word!]}"
##--more tree args/params/flags, but all together as one word! eg: "-xl --noreport"
flags2="" ;
:  ${flags2:=$2}

echo;  echo  "==============STA1:: $(date +%Y%m%d-%H%M%S) : ==============================="
echo "--- showing Tree , Sizes, Structure of $startDir1 : ----";
echo "for full cmds/arguments see below at the end of this printing!"

echo;  echo ============================= df :
df -h  "$startDir1"

echo;  echo ============================= ll :
ls -la  "$startDir1"

echo;  echo ============================= du :
du -m -d2 "$startDir1"  | sort -n

echo;  echo ============================= tree-1 :
tree -d -L 1  $flags2  "$startDir1"

echo;  echo ============================= tree-2 :
tree -d -L 2  $flags2  "$startDir1"

echo;  echo ============================= tree-3 :
tree -d -L 3  $flags2  "$startDir1"

echo;  echo ============================= tree-4 :
tree -d -L 4  $flags2  "$startDir1"

echo;  echo ============================= commands/script-lines executed were:
cat $0   | grep  -F -v "echo"

echo;  echo  "==============END1:: $(date +%Y%m%d-%H%M%S) : ==============================="

