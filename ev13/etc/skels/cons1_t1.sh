#!/bin/bash
# -case: before anything there on srv! save this to eg /tmp/t1 to start setting up evv-env!
#
echo "-------- 1"
export | grep -i hist
declare -x HISTCONTROL="ignoreboth:erasedups"
unset HISTFILE
echo "-------- 2"
export | grep -i hist


echo "-------- 3"
ls -la /var/tmp/tmpu/
find /var/tmp/tmpu/   -type f
#-? rem -rf /var/tmp/tmpu/  ; mkdir  /var/tmp/tmpu/up1
ls -la /var/tmp/tmpu/    

