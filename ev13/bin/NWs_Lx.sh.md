
	_______:  ---------------- NWs-cmds-coll-Adms .... : _____________________
-!! here only cmd-coll-qcks-handys1 for more dvntc see Lx/Arx-dnts !!
##________________________________________  ___________________________


#####  ==========  qcks-systemD-bin-NWs:
	systemctl  restart systemd-resolved.service   systemd-networkd.service  systemd-networkd.socket  wpa_supplicant.service
	systemctl   stop   dhcpcd.service
    ---
    - google-DNS-devs:   ping  8.8.8.8 / 8.8.4.4   #-IP6:  2001:4860:4860::8888 / 2001:4860:4860::8844
##________________________________________  ___________________________


#####  ==========  samba / mswin-shares+rsyncs,... qcks:
	- listing-all-MsWIn-shares-on-X13:   smbclient -L \\192.168.43.15  ##- bzw.  \\ X13  ;but foor netbios-hostnames must start winbind.service :
	- try with IPs instead hostname! easier!
    - if using hotnames-of-mswin-PCs /NetBios-names:  systemctl start winbind.service
	- pathes:  smb://192.168.43.15/x13-t1_loc/  bzw.  smb://X13/x13-t1_loc/

    --- rsync-steps/nts of cifs parts:
    -! mswin-share can be mounted ONLY with PW set for the mswin-user ! empty-PWs or anonym does NOT work here!
    - for rsync also the share-permissions MUST be set to full-perms, if want to rsync to it !
    - the mswin-nw should be as private-NW!
    - if connection-problems, then try disabling mswin-firewall on that NW-connection !?
    - smbclient -L  192.168.43.15  --user=u1
    - mount -t cifs  //192.168.43.15/t1_Lv13   /mnt/t1  -o  username=u1,iocharset=utf8,uid=u1,gid=gu1  ##--file_mode/dir_mode/masks have kaum effekt ...! see man !
    - rsync ... --no-perm  --no-own ...; eg:  rsync -n -avO  --no-perms [-u]  /up1/t1/w1_RF/dc1K/  /mnt/t1/w1_RF/dc1K/
##________________________________________  ___________________________


#####  ==========  wpa_supplicant cmds/coll/qcks :
	--- cmds-qcks..wpa_supplicant ...:
	 - non-hidden-APs, in a root-shell (not-sudo, due to subprossess in cmdline):   wpa_supplicant  -B  -i  wlan0  -c <(wpa_passphrase "bibliothek1-AP" "06.01.2020cC")  ##--OR ohne -B to run in forground !
	 - hidden-AccessPoints:  you need a config file, due to adding  scan_ssid=1  to it :
	 wpa_passphrase "bibliothek1-AP" "06.01.2020cC"  >  my-ssid1.conf ; ##--edit it and add the line into network-block !
	 wpa_supplicant  -B  -i  wlan0  -c my-ssid1.conf
	---
	wpa_cli  reconfigure
	vi  /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
	systemctl is-enabled wpa_supplicant
	---
	vimdiff   /up1/media/syys5/etc/wpa_supplicant/wpa_supplicant-wlan0.conf    /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
	vimdiff   /etc/wpa_supplicant/wpa_supplicant-wlan0.conf     /up1/.cuue/etc/syys-uue/00-allsyys/wpa_supplicant-wlan0.conf
	lla  /etc/wpa_supplicant/wpa_supplicant-wlan0.conf   /up1/.cuue/etc/syys-uue/00-allsyys/wpa_supplicant-wlan0.conf   /up1/media/syys5/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
##________________________________________  ___________________________


#####  ==========  HWs_NWs-infs / NW-module-/driver-NWs reload/restart:
	- find your wireless driver , and then reload its module/driver :
	sudo lshw -C network    ##and see for wireless-interface:  driver=iwl4965     ##-- lshw - list hardware
	/OR  sudo  lspci -knn   ##--  | grep -i network  -A3  ; /OR  grep -i eterneth  -A3 
	reload its module/driver (by x13-wireless:  iwl4965) :    sudo modprobe -r  iwl4965  &&   sudo modprobe -i  iwl4965
	- modules/drives are in  /lib/modules/`uname -r`/kernel/net/wireless/....   eg in x13-ubt-18.04:  /lib/modules/4.15.0-46-generic/kernel/drivers/net/wireless/intel/iwlegacy/iwl4965.ko
##________________________________________  ___________________________


#####  ==========  legacy-"net-tools"-pkg--legacy-cmds,  NWing-configs: routing, configs, IPs, macs, local-NWs-confs,....:
	- sudo iwconfig wlan0  ESSID  gc1-5gh   ##--connect WLAN to gc1-5gh 
	- sudo route add default gw 192.168.2.2 eth0  ##adding default router to eth0
	- find/scan/query all Mac-Adresses and IPs of all local devices in L1NW/... :  nmap -sP 192.168.2.0/24  (adappt IP-subnet to your local subnet!!)
	- (el1d ; hostname; lsb_release -a ;echo ==========; route -n ;echo ==========;  ifconfig  ; el1de ; ) >>  ${l1nwStatsDP}/NWs_Routs_Modems_Int_l1nw/0-NWconfs-l1nw-coll_RF.txt
##________________________________________  ___________________________


#####  ==========  NetworkManager :
	/bin/systemctl    disable/enable/start/stop/status    network-manager.service
	--- SysV :
	sudo  service  network-manager  --full-restart   ##--ubt-15.10  , startet wlan-manager..., esp. if wlan-icon not there, ok!
	WLAN-config-files:    /etc/NetworkManager/system-connections/
##________________________________________  ___________________________


#####  ==========  
##________________________________________  ___________________________

