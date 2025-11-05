#!/usr/bin/bash

set  -o  nounset  ##== set -u
##--??:
set  -o  errexit  ##== set -e

##--REQ-pre , do manually:  bupsvar1 MUST be mounted!:  mount /up1/media/HDD11
##--REQ-pre , root/sudo run !! due to /home , /etc, ...
##--more-pre-2do:  bups1HomeRest.sh ; bups3mespAR ; 
cd  ${vaarAuBups1DP}  || { echo "$q_fatalErrorTag  prereq:  mount-the-bups1-source: ${vaarAuBups1DP} " ; exit 5 ; }

echo ; echo  "--------------------" ; 
bups1up1
echo ; echo  "--------------------" ; 
bups1syys    ##--calls:  bups1syysModFiles() and bups1configsUsers() !
echo ; echo  "--------------------" ; 
bups3etc
echo ; echo  "--------------------" ; 
bups5home
echo ; echo  "--------------------" ; 
bups1mesp
##---
el1e
ls  -l -Ah  *[-_.]$(date +%y%m)[0-9][0-9]*

##--REQ-pos , do manually:  umount bupsvar1 :  umount /up1/media/HDD11
