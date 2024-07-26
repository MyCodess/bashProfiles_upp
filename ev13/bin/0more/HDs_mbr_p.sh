#!/bin/bash

##- HDs-MBRs+PartionTable-saving,handling...:
#-ii-! see  devNts/mbrs.tx  AND  /up1/w/docs/Linux/Booties_Rescues/MBRs/MBR_wikip.pdf  for address-table !
#-ii-  see  man gpart + !! /BKs_Ux/UnixToolbox/UnixToolbox.htm --> 14.5 dd : "MBR tricks"
#-ii- only.show partition-structure from a file: gpart -vdg xxx.dd.mbr (file must be a whole mbr-image of 512 Bytes!) , IGNORE its complaint about extended partitions, see man gpart ! , IGNORE its complaint about extended partitions, see man gpart !
#-! sectors [00-62] (so the first 63 sectors) of HD does NOT belong to any partition and are for Bios/mbr/bootloader/... .So the first sector of a part can be the 64th physical sector (logical 63). each sector of 512-Bytes.

#-ii-!----------- UnixToolbox.htm --> 14.5 dd : "MBR tricks":
#	The MBR contains the boot loader and the partition table and is 512 bytes small,
#	The first 446 are for the boot loader, the bytes 446 to 512 are for the partition table. So with MBR-Backups with dd: 
# dd if=/dev/sda of=/mbr_sda.bak bs=512 count=1       # Backup the full MBR
# dd if=/dev/zero of=/dev/sda bs=512 count=1          # Delete MBR and partition table
# dd if=/mbr_sda.bak of=/dev/sda bs=512 count=1       # Restore the full MBR
# dd if=/mbr_sda.bak of=/dev/sda bs=446 count=1       # Restore only the boot loader
# dd if=/mbr_sda.bak of=/dev/sda bs=1 count=64 skip=446 seek=446 # Restore partition table
#-------------------- end-UnixToolbox.htm

myname1="$(basename $0)"
USAGE1="====USAGE: $myname1  <HDDevice--NoPartitionID> <HDtag> ; eg $myname1  /dev/sdb  D06_LA_80GB"  ##-??- or /dev/sdb1 for dd ???
HDDevice=$1     ##- eg /dev/sdb  ;see note below!!
HDtag="${2:?$USAGE1}"

##--
HDDeviceNode=${HDDevice##*/}  ##- only last part of device-path as "sdb" in /dev/sdb
currDateStr1="$($cudts)"
fnPrefix="${currDateStr1}_${HDDeviceNode}_${HDtag}"

##-- ======== MBR-images of HDs with dd ... :
dd if=${HDDevice} of=./${fnPrefix}.dd.mbr  bs=512 count=1

##-- MBR only, so NO partition-table!!:
dd if=${HDDevice} of=./${fnPrefix}_onlyMBR_noPartTab.dd.mbr  bs=446 count=1

##-- Partition-Table only (but still needed that the rest of 512 MBR-Bytes are ok)!!: part-tab is 64 Bytes after 446 in MBR:
dd if=${HDDevice} of=./${fnPrefix}_PartTabOnly.dd.mbr  bs=1 count=64 skip=446
#-ii-!! writing back ONLY partition-table to HD/mbr (see man gpart): dd if=HDX.mbr of=/dev/sdX bs=1 count=64 skip=446 seek=446

##-- ======== all first 63 physical sectors (logical-adr. 00-62), just for case, and also for bootloader, if needed:
dd if=${HDDevice} of=./${fnPrefix}_all63sectors.dd.mbr bs=512 count=63

#--  ======== sfdisk-dumps:
sfdisk -d ${HDDevice} > ./${fnPrefix}_sfdiskDump.sfd

#--  ======== Infos-coll, HD-Struktur-Infos, descp,... just to know:
echo  "========== lsblk :   $(date +%Y%m%d-%H%M%S) : ==============================="  >>  ./${fnPrefix}_HD_infos.log
lsblk                     ${HDDevice}    >>   ./${fnPrefix}_HD_infos.log
echo  "========== lsblk -f -o +SIZE,MODEL : ========================================"  >>  ./${fnPrefix}_HD_infos.log
lsblk -f -o +SIZE,MODEL   ${HDDevice}    >>   ./${fnPrefix}_HD_infos.log
echo  "========== lsblk -O: $(date +%Y%m%d-%H%M%S) : ==============================="  >>  ./${fnPrefix}_HD_infos.log
lsblk  -O                 ${HDDevice}    >>   ./${fnPrefix}_HD_infos.log

ls -l ${fnPrefix}*

