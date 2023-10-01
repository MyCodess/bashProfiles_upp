__________________  system-admins-maintains.sh.txt : _________________________
exit 3
--####################### uue-syysStat/L1NW-uue-syys-doings : ###########################


#####  ==========  sudos:

	_______:  profiles running with sudo cmds:
	--- nts:
	- two points/problems considering if youwant run evv-funcs/aliases:  1-if-Abfrage in /etc/bash.bashrc : if the shell is non-interactive do nothing/exit !  2-aliases NOT expanded in non-interactive mode!
	-! (somehow did NOT work for aliases even with: shopt -s expand_aliases ; ... ! ONLY worked with /bin/bash -i ... !!)
	-! "sudo -i ...", then  the bash-shell itself is NOT in interactive mode yet !so aliases are not applied. 
	-! sudo -i / -s ...: does NOT execute shell-profiles, also due to the Abfrage-if-interactive in /etc/bash.bashrc !! sudo-call is as default non-interactive and with -i profiles are stopped in /etc/bash.bashrc !! so for executing your profiles:
	--- OK-for-funcs/cmds---NOT-for-aliases):
	sudo -- /bin/bash -c  "q_profsDebug11=10 source /up1/.cev/etc/profile.sh ; func1 xx yy" ##--BUT-NOT working for aliases !!
	--- OK-for-all (incl. aliases):
	sudo -- /bin/bash -i -c  "q_profsDebug11=10 source /etc/bash.bashrc ; alias1 "  ##--must -i at least here for arx, due to if-Abfrage-if-interactive in /etc/bash.bashrc !
	- for aliases (two problems: 1-if-Abfrage-if-interactive in /etc/bash.bashrc  2-aliases not expanded in non-interactive mode!):
	--- not-working then:
	sudo -- /bin/bash  -c  "q_profsDebug11=10 source /etc/bash.bashrc ; nwsConn1  1q_bib_HBoell_wpa1.conf" ##--Not working also, but just due to the if-clause there in /etc/bash.bashrc, to check if the shell is interactive !!
	sudo -- /bin/bash  -c  "shopt -s expand_aliases ; tq_profsDebug11=10 source /up1/.cev/etc/profile.sh ; shopt -s expand_aliases ; alias1"  ##--!also NOT-working for aliases! but fine for funcs!
##________________________________________  ___________________________


#####  ==========  init 0/1/3 with systemd ... ("target"  instead system-V init-levels!):
systemctl  list-units  --type=target   ##--listing of all possible init-levels/targets
-! by boot-up, boot into init-X :  add to the kernel-params in grub.cfg:  systemd.unit=X ;   https://wiki.archlinux.org/index.php/Kernel_parameters#Parameter_list
- /OR switch into init-X , eg goto init-3/no-XWin :   systemctl isolate  runlevel3.target  ;/OR  multi-user.target  ;  https://wiki.archlinux.org/index.php/Systemd#Targets
	- boot-into-init-1/single-user:  	systemd.unit=runlevel1.target    /OR   systemd.unit=rescue.target
	- boot-into-init-3/Multi-user,   	systemd.unit=runlevel3.target    /OR   multi-user.target ##non-graphical
	- boot-into-init-5/graphical:    	systemd.unit=runlevel5.target    /OR   graphical.target
##________________________________________  ___________________________


#####  ==========  syysTg Kernl-params/sysct , Kernel-Modules, ... :
(el1d  "cmd:  sysctl --all" ;  sudo sysctl --all | sort  ; el1de ) >   ${syysTgStatsConfigsDP}/kernel-params-sysctl-$($cudts).log
(el1d  "cmd: lsmod " ;  lsmod | sort  ; el1de ) >   ${syysTgStatsConfigsDP}/kernel-modules-$($cudts).log
##________________________________________  ___________________________


#####  ==========  uue-syysStat-updates:
- putting putNoBupFlag.sh in all cache/trash/...-Dirs:  find /home/  -type d  \( -iname "*trash*" -o -iname "tmp" -o -iname "*thumbnails*" -o -iname "*cach*" -o -iname .chmsee -o -iname .beagle -o -iname .adobe -o -iname .macromedia \) -exec putNoBupFlag.sh {}  \; 
- syysStat-update: syysStat.sh >> ${syysTgStatsNtsFP} 2>&1
- syys-bup from t1->t2 (preferably do it with rsync !!):
	(el1d  ; echo "BACKUP on medias1 :" ; date ; hostname ; el1d  ) >> ${syysDP}/${syncFlgFN}
	- only-curr-syysTg:   cp -uRd -v --preserve=timestamp  ${syysTgDP}   ${bups2DP}/sy1/$(hostname)/
	- whole-syys-dir:    cp -uRd -v --preserve=timestamp  ${syysDP}/*  ${bups2DP}/sy1/$(hostname)/
-- prev-bup-to-syystg...:
tar -cjvf $($cuds)_${LOGNAME}_kde.tbz --exclude-caches  --exclude-tag="${uueNoBupFlagFN}"  --show-omitted-dirs .kde .kderc
cp $($cuds)_${LOGNAME}_kde.tbz  $sysIDBupsDP
mv $($cuds)_${LOGNAME}_kde.tbz  $vaarAubups2DP
##________________________________________  ___________________________


#####  ==========  HDs-/Parts-/Medias-Status and infos, also for Bup into L1NW-status-logs  Dxx_nts.txt , HDs-structure-bup, parts....: !!! DIFF between commands per DISKS or per Partitions!!:

	_______:  grub-qckys:
	vi  -p  /etc/default/grub  /boot/grub/grub.cfg  /boot/grub/custom.cfg   /etc/grub.d/*

	_______:  lsblk :
	-!!!  DIFF   UUID<--->PARTUUID  :
	UUID is the ID of the filesystem, eg relevant for grub-boot !
	PARTUUID  is the ID of the Partition , eg relevant for UEFI-bootloader !! (pre-FS !)
	checkit with: lsblk -o UUID,PARTUUID
	lsblk  -f  -o+SIZE,TYPE,RM,MODEL,SERIAL
	lsblk  -o   NAME,FSTYPE,LABEL,UUID,MOUNTPOINT,SIZE,TYPE,RM,MODEL,SERIAL
	sorted-PartNames, but then NO tree, but listing : lsblk  -xNAME ...  ##/OR -x<sort-field-ID>

	_______:  
	fsck.ext4  -p -D -E optimize_extents -f -F -c -k  /dev/sdbX    ##--/OR -cc for read+WRITE-chek, but then takes much longer! on-x13-usbcard 4-std/18-GB  for arx1 on /dev/sdb3 !
	fsck -MC    /dev/sdb4
	fdisk -l    /dev/sdb   >> Dxx_nts.txt
	tune2fs -l  /dev/sdb3  >> Dxx_nts.txt
	sfdisk -d   /dev/sdb   > sfdisks/Dxx.$($cuds).sfdisk
	dumpe2fs    /dev/sdb4  > sfdisks/DxxPx.sdb4.$($cuds).dumpe2fs 
	echo "=========== $(date) : ==================" >> HDxx.txt

	_______:  USB-Devs:
	- check/verify USB-Stick-physical-health (bad blocks):  
		- e2fsck  -c[c]  /dev/sdXX ...
		/OR first only finding bad sectors:
		- badblocks  -s  -w  -o usb64-badblocks1.log  /dev/sdc  ##--> takes rather long! for 64GB-USB3-Stick to USB3-port 3-4 hours !?
		if found bad sectors/blocks, then later by formating do: e2fsck -l usb64-badblocks1.log  /OR better: e2fsck  -c[c] ##--see man e2fsck
##________________________________________  ___________________________


--####################### Lx-Sys-Admins: ################################################
#####  ==========  tweaks:
- gsettings / gnome-tweaks  :   GUI:  /usr/bin/dconf-editor   , cmdline: gsettings ...
##________________________________________  ___________________________


#####  ==========  Ubuntu-admins...:

	_______:  update ubuntu:
	apt-get   update ; apt-get     --with-new-pkgs upgrade ; apt autoremove ;
##________________________________________  ___________________________


#####  ==========  NASx-kramm-kk:

	_______:  on x13
	mount.nfs  nas2:/volume1/Daten1/   /up1/media/nas2-d1
	mount.nfs  nas2:/volume1/          /up1/media/nas2-d1

	_______:  on NAS2 (login by ssh admin@nas2 ):
	source  /volume1/Daten1/00-wk1/uue1.sh
##________________________________________  ___________________________


#####  ==========  date/times...:
	-! set time +/-hour (for summer/winter-time):   date --set='-1 hour'
##________________________________________  ___________________________


#####  ==========  rpms: handling/listing/....:
	#-- description-listing of all rpms on DVD for info/search/...:  cd packs ; 
	find ./suse103_cd/suse/ -iname "*.rpm" -exec  echo -e "\n\n==================== {} : ============" \; -exec  rpm -qip {}  \; | tee suse103_cd_rpmsInfoListing_all.lo
	--####################### suse-2013pre--olds/prev/arc: ################################################
##________________________________________  ___________________________


#####  ==========  SuSe-Systems : =========================================================
##________________________________________  ___________________________


#####  ==========  suse.system.kramm:
	- suse-curr-instaled-version?? :  suseCurrVersion=$(awk '/^VERSION/{print $3}' /etc/SuSE-release)
##________________________________________  ___________________________


#####  ==========  Zypper-Quickies-SuSe (more see nts in devNts):
	- alternative repos-DIR as u1:  zypper --no-refresh  --reposd-dir /etc/zypp/repos.d.suse113/ se eclipse
	- zypper up --auto-agree-with-licenses   --download in-advance
##________________________________________  ___________________________

