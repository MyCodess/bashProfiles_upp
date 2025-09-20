#!/bin/bash
set -u
myname11="${0##*/}"

# set dry11=1  to simulate/dry-run-only !
#
## usage-eg:  dry11=1  find  .  -xdev  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"  -exec  renAlnum1.sh {} \;
## usage-eg:  dry11=1  find  .  -xdev  -depth  -regextype posix-extended  \( -ipath "*ProgsRes*" -o -ipath "*Imgs_L1NWs*" \)  -prune -o  -regex  ".*[^[:alnum:]/_.-].*"  -exec  renAlnum1.sh  {} \;
## obsol--preForLoopHere_singleFileVer  :: usage-eg:  dry11=1  for ii in *; do renAlnum1.sh ; done

usage11="USAGE:  [dry11=1]  ${myname11}  <filename filename ...>   ##-renaming a file to ONLY-alnum+/evv-conform ! very simple variant! simulation with dry11=1 (/OR export dry11=1 for a tree with find-cmd)"
dry11=${dry11:-""}   ##--I-due to set -u it must be defined, but only as NULL! all other values are true-dry/-simulation !!

fn1="${1:?$usage11}" ;

for fn1 in "$@"; do
	fn1_new="$( echo "$fn1" | sed  -e 's@[^[:alnum:]/_.-]@-@g' )"
	[[ $dry11 ]] &&   echo "__dry:  ${fn1}  ---->  ${fn1_new}"  ||  mv  -iv  "$fn1"  "${fn1_new}"
	##__  variant-2:    [[ $dry11 ]] &&   cmd11="mv  -inv"  ||  cmd11="echo" ;   ${cmd11}  "$fn1"  "${fn1_new}"  ;
done

