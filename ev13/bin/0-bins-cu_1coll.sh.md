__________________  bins-coll-tr-uue.sh.txt : ________________________________
exit 3


#####  ==========  cu-bins/cmds/..., ?tr? or fix? /...:
    gb1.sh   /up1/varu/varau/wks/gh1/repo1
    gb1.sh   /up1/varu/varau/wks/gh1/syncFolders1/
    ---
    chromium   --incognito  > /dev/null 2>&1   &
    --- terms1:
    rt:  cdvarau  ; export DISPLAY=":0.0" ;  dbus-run-session -- xfce4-terminal --disable-server --tab --tab --tab --tab &  ##--alias terms1 NOT working!
    m :  cdwpadm  ; export DISPLAY=":0.0" ;  dbus-run-session -- xfce4-terminal --disable-server --tab --tab --tab --tab &  ##--alias terms1 NOT working!
    rt:  cdvarau  ; export DISPLAY=":0.0" ;  terms1col3  &  ##--  terms1
    m :  cdwpadm  ; export DISPLAY=":0.0" ;  terms1col5  &  ##--  wpmterms1
##________________________________________  ___________________________


#####  ==========  Devels/...:
    gb1.sh   /up1/varu/varau/wks/gh1/repo1
    gb1.sh   /up1/varu/varau/wks/gh1/syncFolders1/
##________________________________________  ___________________________

#####  ==========  sed/replacements/...:

    - w1-RootDIRs-capitalization-ranamings:   sed  -i.dcW1  -e 's@dc1k@dc1K@g'  -e 's@dcAl@dcAL@g'   -e 's@dcIt@dcIT@g'   pathes.sh 
##________________________________________  ___________________________

#####  ==========  xfce4

	_______:  m1/t1-launches:
    dbus-launch    --exit-with-session    xfce4-settings-manager
    dbus-launch    --exit-with-session    thunar
##________________________________________  ___________________________


#####  ==========  gnome-terminal problem as another-user /:190413 ubt-18.04.2 :

	_______:  must set DISPLAY for dbus (eg DISPLAY=:0 )! 
    dbus-update-activation-environment --verbose --systemd DISPLAY
    /OR?:  dbus-update-activation-environment  DISPLAY=:0
##________________________________________  ___________________________


#####  ==========  finds in /up1/ ,...:

    - BKs-IT-find:
    find  /up1/w/BKs1_RF/BKs1_ITs/  /up1/w2/BKs2_RF/BKs2_ITs/  -iname "*ant*"
    - BKs-All-find:
    find  /up1/w/BKs1_RF/  /up1/t2/w2_loc_RF/BKs2_RF/  -iname "*xxx*"
##________________________________________  ___________________________


#####  ==========  PRJs:
    - devnts/X_wp files:   mkdircd  /0devNts/javas/j_wp ; ls /up1/w/docs_m/dres/0devNts/pl/pl_wp | sed -e 's/pl_/j_/g' | xargs touch 
##________________________________________  ___________________________


#####  ==========  file-types ...:
    - is the file a text/plain one??:      [[  "text/plain" != $(file -b --mime-type $1 ) ]]  && echo "$1  :  __NO_Plain_TXT__ " ;
##________________________________________  ___________________________

