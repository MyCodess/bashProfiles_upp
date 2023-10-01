#!/bin/bash

##--Setting the brightness of Display as/instead  "<Fn>+ -/+"
##--see:  https://wiki.archlinux.org/title/backlight

USAGE11="USAGE1:  sudo  $0 <brightness-to-set: 0-to-255>"

##__  brightness_RD="/sys/class/backlight/amdgpu_bl0/" ;
brightness_RD="/sys/class/backlight/ideapad/"  ;  ##-- Lv13 /_230109
echo $USAGE11 ;
echo "-------------------------------------------";
cd ${brightness_RD}; pwd ; ls -la ;
echo "-------------------------------------------";

echo "___ MAX-brightness possible :"
cat    ./max_brightness  ;
##__  cat    /sys/class/backlight/amdgpu_bl0/max_brightness  ;

echo "___ cu-brightness was :"
cat   ./brightness  ; cat   ./actual_brightness ;
##__  cat /sys/class/backlight/amdgpu_bl0/brightness  ;
##--with-xfce-powerMgm:   xfpm-power-backlight-helper  --get-brightness  ;

##__  set -x ; echo "_______ $1 ________" ;
echo  $1   >|  ./brightness
##__   echo  $1   >|  /sys/class/backlight/amdgpu_bl0/brightness
##--with-xfce-powerMgm:   pkexec xfpm-power-backlight-helper  --set-brightness  $1 ;

echo "___ cu-brightness is  :"
cat   ./brightness  ; cat   ./actual_brightness ;
##__   cat /sys/class/backlight/amdgpu_bl0/brightness  ;
##--with-xfce-powerMgm:   xfpm-power-backlight-helper  --get-brightness  ;

