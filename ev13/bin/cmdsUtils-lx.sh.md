_________________ cmdline-utils mainly standard-cmds-of-distors which basicalyy always are there or see (for more aaps/utils see extra-nts here!): ___________
exit 3
##________________________________________  ___________________________


#####  ==========  int_Browsers_cmdline (lynx, w3m. elinks, curl)
-!!  https://wiki.archlinux.org/title/List_of_applications
-!!  pacman -Ss "web browser"  #--/OR  "web browser" , but some say: www browser , w3 browser, ...!

	_______:  curl :
	-!! sending POST-data with curl/cmdline (see /doc protocol! ):  curl -v -X 'POST'   'http://127.0.0.1:8000/items/'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -d '{ "name": "n1", "description": "desc1", "price":  1, "tax": 1 }'

	_______:  quering the webpage-Last-Modified-date-time , last-update? /OR the whole webpage-header :
	works NOT for dynamically generated pages ! for static-pages:
	- w3m   -dump_head  https://xxx.com  |grepi Last-Modified  #/OR:
	- curl  --head      https://xxx.com  |grepi Last-Modified  #/OR:
	- links <URL> ; then just hotkey "|"  ;/OR:  <ESC> to go to the Menu, and then "view"->"Header Info": "Last-Modified" tag !
	-- /OR per javascript-abfrage in the page:
	- call-the-webpage in your browser; goto-address-bar; delete whole URL; enter there: javascript:alert(document.lastModified) #done! NOTE: usu. Browsers delete "javascript:" in the URL ,eg by CopyPaste ! so retype it if so!
	- call-the-webpage in your browser; goto-dev-console (in vivaldi: developer-tools->inspect->console) and just enter:  javascript:alert(document.lastModified)
##________________________________________  ___________________________


#####  ==========  wgets.similar.apps:  offline browser, http-spiders, download managers, ... :
-!!   https://wiki.archlinux.org/title/List_of_applications

	_______:  "offline browser":      - pacman -Ss "offline browser"  ;# httrack , ...

	_______:  "download manager"  :  	- pacman -Ss "download manager"
##________________________________________  ___________________________


#####  ==========  xdotool : programmatically (or manually) simulate keyboard input and mouse activity, move and resize windows, etc.  in X11 , see man xdotool :
	- fake keyboard/mouse input, window management, and more ..., man xdotool  bzw.   https://www.semicomplete.com/projects/xdotool/
	- eg. closing thunar/nemo/....:   xdotool --name "Thunar"  key  ctrl+q
	--- examples from   https://www.semicomplete.com/projects/xdotool/  :
	- eg. Example: focus the firefox url bar:  xdotool search "Mozilla Firefox" windowactivate --sync key --clearmodifiers ctrl+l
		/OR older-style:  WID=$(xdotool search "Mozilla Firefox" | head -1) ; xdotool windowactivate --sync $WID ; xdotool key --clearmodifiers ctrl+l ;
	- eg. Example: Resize all visible gnome-terminal windows :
		xdotool search --onlyvisible --classname "gnome-terminal" windowsize %@ 500 500
		/OR older-style:  WIDS=$(xdotool search --onlyvisible --name "gnome-terminal" ); for id in $WIDS; do  xdotool windowsize $id 500 500 ; done
##________________________________________  ___________________________


#####  ==========  DVD/CD to ISO-file: Creating an ISO image from a CD, DVD :

	_______:  1-method ! (NOT copying  empty blocks of the DVD! so only DATA! get smaller than 4GB or so ....):
	https://wiki.archlinux.org/title/Optical_disc_drive#Making_an_ISO_image_from_existing_files_on_hard_disk :
	In order to only copy actual data from the disc and not the empty blocks filling it up, first retrieve its block/sector count and size (2048 most of the time):
	$ isosize -x /dev/sr0
	sector count: 2041796, sector size: 2048
	or alternatively:
	$ isoinfo -d -i /dev/sr0 | awk '/block size|Volume size/'
	Logical block size is: 2048
	Volume size is: 2041796
	Note: Do not forget to replace /dev/sr0 with your optical drive device name.
	Then use dd to copy the data using the obtained values:
	$ dd if=/dev/sr0 of=discmage.iso bs=sector_size count=sector_count status=progress

	_______:  2-method:  dd if=/dev/cdrom   of=./cdrom_image.iso  ##--whole-CD, so so bias CD-/DVD-capacity !

	_______:  3-method: ISO from a DIR:    mkisofs  -o  /tmp/cd.iso  /tmp/directory/    ##-To make an ISO from files on your hard drive;  mkisofs in community/cdrtools
##________________________________________  ___________________________


#####  ==========  
##________________________________________  ___________________________

