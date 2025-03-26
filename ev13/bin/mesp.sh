#!/bin/bash
##__ source  /up1/.cev/etc/profile.sh ;  ##--II-required if with "sudo" !! not-working: source  /etc/bash.bashrc due to non-interactive! see there !
set  +o  history
##__ set -xe
##--II-dnts-see-at-END-here-below !!!
USAGE1="USAGE: $0 <mespNo>  < opena | open-cry | closea | close-cry | umount1 | stat > ;  eg:   $0  1  opena"  ;
export PS4="  :::==:::  ";

##-------- setting-current-params:
declare -i _mespNo=${1:?$USAGE1}
_action=${2:?$USAGE1}
##--mesp-params: 
_mespFN=mespfsc${_mespNo}               ##--Link-encFileName, eg "mespfsc1" (in the link to the physical-encFile);(phys. filename is mespfsc1_RF) , AND also same used in /dev/mapper/<entry-name> done by "cryptsetup open ..."! so filename used in the link to the Phys-enc-file (could have been the same as physical-FN, but to be sure independent of physical pathes, here a bit different, so not mespfsc1_RF as phys-name, but only mespfsc1 ) ! 
_mespFP=${mespRTDP}/${_mespFN}          ##--Link-encFilePath, eg /up1/mesfs/mespfsc1 (is a link to the Phys-enc-file)
_mespMountDP=${mespRTDP}/mesp${_mespNo} ##--mount-point-dir in for device-mapper/cryptsetup, eg /up1/mesfs/mesp1 , also used in fstab !
_mespMapperFP=/dev/mapper/${_mespFN}    ##--mount-device-path , also in fstab, in  /dev/mapper/xxx , also used in fstab !
_mespLoopFP=/dev/loop${_mespNo} ; (losetup  ${_mespLoopFP}   2>/dev/null  1>&2 ) &&   _mespLoopFP=$( losetup -f ) ;  ##--/OR- directly just: _mespLoopFP=$( losetup -f ) ;   ##--prev-with-fixed-NR:  
export enc_open_params1='--hash=ripemd160  --cipher=aes-cbc-essiv:sha256  --key-size=256  --offset=0  --skip=0'  ##--I-for plain-dm-cryp! do define also the defaults! see nts! /_180110 ;

##__ set -x ;
# open-cry == open-crypt-but-NOT-mount , umount1 == only-un-mount , close-cry == close-crypt-(and try umount BUT do NOT care if ok bzw. if already umounted!)
case $_action in
	"open-cry"  )  losetup -v ${_mespLoopFP}  ${_mespFP}     && cryptsetup  --type  plain  $enc_open_params1  open  ${_mespLoopFP}  ${_mespFN}  &&  echo "=== opened: ${_mespFN}" ;;
	"opena"     )  losetup -v ${_mespLoopFP}  ${_mespFP}     && cryptsetup  --type  plain  $enc_open_params1  open  ${_mespLoopFP}  ${_mespFN}  &&  echo "=== opened: ${_mespFN}"  && mount ${_mespMountDP} && echo "=== mount-done" ;;  ##--open-All: open-loop-crypt-mount---do-ALL-to-access
	"closea"    )  sync;sync;sync ; umount ${_mespMountDP}   && cryptsetup  close  ${_mespFN}  && losetup -v -d $(losetup  -O NAME -n  -j  ${_mespFP} )  && echo "=== closed-and-Umounted: ${_mespFN}" ;;  ##--close-All: close-and-umount-and-loopDetach---ALL-close
	"close-cry" )  sync;sync;sync ; umount ${_mespMountDP}   ;  cryptsetup  close  ${_mespFN}  && losetup -v -d $(losetup  -O NAME -n  -j  ${_mespFP} )  && echo "=== closed-and-Umounted: ${_mespFN}" ;;  ##--close-All: close-and-umount-and-loopDetach---ALL-close
	"umount1"   )  sync;sync;sync ; umount ${_mespMountDP}  ;;
	"stat"      )  ;;    ##--II- always will be done on the last line of the script. here just to accept status as case-param and to avoid the next error-msg!
	*           )  echo "==##==ERROR: $USAGE1" ; exit 3 ;;
esac

echo; echo "======================= Status: ============================" ;
##--!!-  keep te Formats below, even the comments and empty lines ! they will bei ALL printed out, in case of "set -v" , (but not for "set -x")  !!
##__ set -x ;
losetup -av ; echo;
##_______________________________________

ls -l /dev/mapper/mes* ; echo;
##_______________________________________

lsblk -p  |  grep -i -E 'cryp|loop' ; echo;
##_______________________________________

mount -lv | grep mesp ; echo;
##_______________________________________

cryptsetup status ${_mespFN} ; echo;
##_______________________________________

##__ set +x ;
echo "=============__END1__   Status: ====================================================" ; echo;

##==================== nts-cryptsetup .... : ========================================##
##-- sequence-open:   losetup ->  cryptsetup  open   ->  mount   !   --> "open" generates/sets-up also the /dev/mapper entry !
##-- sequence-close:  umount  ->  cryptsetup  close  ->  losetup -d  !    ##-so closing without umounting not possible (damages)! that is why no "closeonly" option hier !!
##-- "cryptsetup open ..." generates also the dev/mapper stuff !!  AFTER it you see the /dev/mapper entries and can mount them !
##-- mount/umount use ONLY with dev-mapper-pathes (not Phys-loop-blockdevice) for mount-point-dir in fstab !! 
##-- "umount -d"  releases/detaches also the /dev/loopX assigment!! so in including "losetup -d /dev/loopX" ! so NOT-using hier due to the sequence-close !
##-- fstab: ANY changes here in mount-points or in dev-mapper MUST be synced with /etc/fstab !!
##-- see extra devnts for more : devnts/lxOSs/sec_enc*  !!
##============__END1__ nts-cryptsetup .... : ========================================##

######################### Hist/stats/nts .... : ##################################################
##  180110	:  NEW mespfsc1_RF with new concepts and sizes: 3GB and plain-dm-cryp !
##  initial	:  LUKS based, first 1 GB, later 2 GB
##
###############___END1___ Hist/stats/nts .... : ##################################################

##----------- more CASE-options if needed :
##__	"openl"     )  losetup -v ${_mespLoopFP}  ${_mespFP} &&  cryptsetup  $enc_open_params1  open  ${_mespLoopFP}  ${_mespFN}  --type  plain  && echo "=== opened-ONLY--not-mounted: ${_mespFN}" ;;  ##--open-crypt-AND-loop
##__	"closel"    )  sync;sync;sync ; cryptsetup  close  ${_mespFN}  && losetup -v -d  $(losetup  -O NAME -n  -j  ${_mespFP} )   && echo "=== closed-and-umounted: ${_mespFN}" ;;  ##--close-crypt-AND-detach-loop
##__	"mount"     )  mount -v  ${_mespMountDP} && echo "=== mount  done: ${_mespMountDP} :" ;;
##__	"umount"    )  sync;sync;sync &&   umount ${_mespMountDP} && echo "=== un-mount done: ${_mespMountDP} : " ;;
##--------------------------------------------


