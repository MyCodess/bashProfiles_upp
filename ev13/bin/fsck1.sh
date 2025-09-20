#!/bin/bash

set -x
#####  ==========  fsck...:  ===============================

##__  
echo; echo "---------- vfat boot-part:: ------------------------";  fsck.vfat  -p -v  /dev/sda2 ; 

##__  
echo; echo "---------- exfat T1:: ------------------------------";  fsck.exfat -p -v  /dev/sda4 ;       ##--of extra/exfatprogs !

##__  echo; echo "---------- mesp: -----------------------------------";
##__  umount /up1/mesfs/mesp1  ;  fsck.ext4  -p -D -E optimize_extents -f -F  /dev/mapper/mespfsc1    ##--mesp1

set +x


## ------------------- more/obsl:
## fsck.ext4  -p -D -E optimize_extents -f -F -c -k  /dev/sdbX    ##--/OR -cc for read+WRITE-chek, but then takes much longer! on-x13-usbcard 4-std/18-GB  for arx1 on /dev/sdb3 !
##__ #-obsl:   exfatfsck  -a    /dev/sda4   ##--of exfat-utils , man exfatfsck  (NOT man fsck.exfat ! but there is also the link: /usr/bin/fsck.exfat -> exfatfsck )

