#!/bin/bash

##--USAGE1:  usage:  sudo -i "${q_BinDP}/syysTgStat.sh"  >> $syysTgStatsNtsFP  ;

cuds11="$($cuds)";
cudts11="$($cudts)";


echo; echo  "==================== Status-System of ${q_syysTg}-$(hostname)-${cudts11} ====================" ;
hostname; date; 

echo; echo "---------- Release/Ditribution: ---------------------------------";
uname -a ;
echo;echo "----- " ;
lsb_release  -a ;
echo; echo "---------- xwins/xdgs: ------------------------------------------" ;
export -p   | sort  | grep -i  xdg ;
##--ubuntu-release-files:   cat /etc/lsb-release ; cat /etc/os-release   ##--also-suse:  cat /etc/SuSE-brand ; cat /etc/SuSE-release ; cat /etc/issue ;

echo; echo "---------- Disks: -----------------------------------------------" ;
fsarchiver probe detailed   2>&1   ; ##--I-otherwise prints out to stdErr as default!
echo;echo "----- " ;
fdisk -l ;
echo; echo "---------- mounts /findmnts : -----------------------------------" ;
mount -l | sort ;
echo;echo "----- " ;
findmnt  -R
echo;echo "----- " ;
findmnt  -D
echo;echo "----- " ;
findmnt  --fstab  --evaluate
echo;echo "----- " ;
findmnt  -R  --evaluate
echo; echo "----__1END mounts /findmnts : -----------------------------------" ;
echo; echo "---------- UUIDs: -----------------------------------------------" ;
ls -l /dev/disk/by-uuid/ ;
echo; echo "---------- blkid: -----------------------------------------------" ;
blkid ;
echo; echo "---------- lsblk: -----------------------------------------------" ;
##__  lsblk  -o   NAME,FSTYPE,LABEL,UUID,MOUNTPOINT,SIZE,TYPE,RM,MODEL,SERIAL,PARTTYPE  ;
lsblk  -i  -O ;
echo; echo "---------- lspci: -----------------------------------------------" ;
lspci -k -nn ;
echo; echo "---------- lsmod: -----------------------------------------------" ;
lsmod   |  sort ;
##_ReDo---!?   
##__  echo; echo "---------- inxi: ------------------------------------------------" ;
##__  inxi -c 0    -Frmxx  ;
echo; echo "---------- NWs: -------------------------------------------------" ;
ip r ;
echo;echo "----- " ;
ip  addr ;  ip link ;


echo; echo  "====--END--========= Status-System of ${q_syysTg}-$(hostname)-${cudts11} ====================";echo;

