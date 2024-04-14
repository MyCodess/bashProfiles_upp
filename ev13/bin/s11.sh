#!/bin/bash

#-f11(){ echo $* ; }
#- renFileAlnum1(){ fn1="$1" ; mv -inv "$fn1" "$( echo "$fn1" | sed  -e 's@[^[:alnum:]/_.-]@-@g' )" ; }
#
##no:  find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"  -exec  f11() {} \;
find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"  -exec  mv -inv  {}  $( echo {} | sed  -e 's@[^[:alnum:]/_.-]@-@g' )  \;
