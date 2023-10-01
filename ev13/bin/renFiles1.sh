#!/bin/bash

##-- renaming files in the CURRENT dir: replace $2 with $3 , after space-replacing
##--!!- do  $0 ... 2>/dev/null  it do not want to see "same file" 
##--   eg.usage: for ii in s1_* ; do renFiles1.sh "$ii" ; done
##--   eg.usage: find .  -xdev  -depth  -type d  -iname "*listen_*" -exec renFiles1.sh {} \;
##--   eg.usage: find .  -xdev  -depth  -iname "*.flg.txt"   -exec renFiles1.sh  {} \;
##-if-wanted-parameterizing with search-and-replacement-strings-without-sed/..., then:  searchStr1="$2" ; replaceStr1="$3" ; ##...

fn1="${1:?USAGE: $0 <filename> [serchWord] [replacement]}" ;
##__  echo  mv  -inv  "$fn1"  "${fn1//_ab1/_1ab}"

exit 0


############# (NEW-bash-style-renamings  uue-oldStyleNaming-to-2015pos-style-namingsi-coll, also with bash-buildin instead sed : #####################
	##--II-new-Style-Substitution with bach-buildin instead sed, if not-complicated not-regExp-neede, ...!  see man bash -->  "Parameter Expansion"  ${parameter/pattern/string}
##__  ========== STDs:
##__ evv-std-renaming:   find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"  -exec renFiles1.sh {} \;  ##--then-uncomment-this-renaming:   mv -inv "$fn1" "$( echo "$fn1" | sed  -e 's@[^[:alnum:]/_.-]@-@g' )"
#
##__  ========== 1cu.misc : 
##__  echo  mv  -inv  "$fn1"  "${fn1//.txt/.md}"
##__  echo  mv  -inv  "$fn1"  "${fn1//rates/StdSatz}"
##__  echo  mv -inv "$fn1"     "${fn1//_1coll_dres/_dres}"
##__  echo  mv -inv "$fn1"     "${fn1//Python-Tutorial-/}"
##__  echo  mv -inv "$fn1"     "${fn1//_kk/_1kk}"
##__ echo  mv -inv "$fn1"     "${fn1//-dc/_dc}"
##__ echo  mv -inv  "$fn1"     "${fn1//[[:digit:]]*-/}"   ##--remoe  digits*- from filenames
##__ echo  mv -inv  "$fn1"     "${fn1//JPG/jpg}" 
##__ echo  mv -inv "$fn1"     "${fn1//win10s/win10}"
##__ echo  mv -inv "$fn1"     "${fn1//devnts/dnts}"
##__ echo  mv -inv "$fn1"     "${fn1//_/-}"
##__ echo  mv -inv "$fn1"     "${fn1//ArbAm/AAm}"
##__ !! ONLY-alnum1.uue-names (chekit! not-checked-fully-yet):    v11='_.-ab+bc-cd?de#11: 22;33-'   ;  echo "${v11//[^[:alnum:]_.-]/8}"  ##-II-ONLY-alnum:  echo "${v11//[^[:alnum:]]/8}

##____________________  uueLabels-unifiying based on : expg   uueLabel1
##-----  1coll-unifying:   pretty complex/un-unifyed in case of _1coll !! STILL somes manually, if in a FN-Path several coll-variations!! but ok!  renamings of ef _collects/-collects/plColl/cmdsColl/-coll/... into _1coll (and excluding finding already _1coll filenames!!) :
##__      newName11="${fn1//Coll/$uueLabel1coll}" ;  newName11="${newName11//[_-][Cc]oll/$uueLabel1coll}"  ; newName11="${newName11//_1collects/$uueLabel1coll}" ; echo  mv -inv  "$fn1"  "$newName11" ;  ##--1cmd:  find  . -depth  -xdev  -iname  '*[_-]*[^1][Cc]oll*'  -exec  renFiles1.sh '{}' \;
##__ echo  mv -inv  "$fn1"     "${fn1//[_-]coll/$uueLabel1coll}" ;
##__ echo  mv -inv  "$fn1"     "${fn1//[_-]sig/_1sig}" 
##__ echo  mv -inv  "$fn1"     "${fn1//[_-]kk/_1kk}" 
##__ echo  mv -inv  "$fn1"     "${fn1//[_-]scan/$uueLabel1scan.}" 
##__ echo  mv -inv  "$fn1"     "${fn1//devnts/dnts}" 
##__ echo  mv -inv  "$fn1"     "${fn1//[_-][Ii]nfs/_inf}" 
##__ echo  mv -inv  "$fn1"     "${fn1//ZfSt/ZFS}" 




############# SED-old-style-replacements, with sed (instead bash-buildin-substitutions): ##############################################
##-I-renaming initial 6-digit-date-stamp to 4-digit-style (eg in Fotos,...). finding them: only-in-cu-dir-with-for:  for ii in * ;do renFiles1.sh $ii ; done  ;/OR-rekursive-with-find-cmd:  find .  -depth  -regextype posix-extended   -regex  ".*/[0-9]{6}.*"   -ls ;
##__  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([0-9]\{4\}\)\([0-9]\{2\}\)@\1@')"
#- all-lower-case + no-space  renaming :   mv -iv "$fn1"  "$(echo $fn1 | sed -e   's@  *@-@g' -e  's@.*@\L&@g')"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^@Li_@')"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@__tgS.@&__tgT8@')"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(..\)_-_\(.*\).mp3@\2__No\1@').mp3"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@---\(..\)__*\(.*\).mp3@---\2__No\1.mp3@')"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@.tar.gz$@.tgz@i')"
#--melon:
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@ *.mp3lemon.net. *@@i')"
# mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(..\)_-_\(..\)_-_\(.*\).mp3@\1---\3__No\2.mp3@')"
#--special-char \' at beginning or end of filename: 
# mv -iv "$fn1" "$(echo $fn1 | sed -e s@^\'@@i  -e s@\'\$@@i)"

############# BKsAudio:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^@TS_Raps---No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@---No\(..\)@---No\1_of6@')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@.wma@_of48.wma@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Unit_\([0-9]\)_@Unit_0\1_@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@No\(.\)\.@No0\1.@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^@Business_StartUp2_WB_CD---No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.4@_of4@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\(..\).*\.\(.*\)@101AmericanIdioms_No\1_of9.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@---\(.*\)_Speaking_My_Mind@---Speaking_My_Mind_\1@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@win7s_\(.*\).txt@\1_win7.txt@g')"
#mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@^\(.*\)---\(.*\)_CD\(.*\)@\2---\1_CD\3@g')"  ##-I- tauschen artist---album.... :to.adapt!
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@__\([0-9]\{4\}\)@__Y\1@g')"   ##-II- converting __2006  to __Y2006  : so adding Y-tag for year!! BKsAu

############# BKs-Publishers, US-Verlage:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^oreilly[_.]\(.*\)\.\(.*$\)@\1_Ore.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^que_publishing[_.]\(.*\)\.\(.*$\)@\1_QUE.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^prentice_hall[_.]\(.*\)\.\(.*$\)@\1_PH.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^sams[_.]\(.*\)\.\(.*$\)@\1_Sams.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^addison_wesley[_.]\(.*\)\.\(.*$\)@\1_AW.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^manning[_.]\(.*\)\.\(.*$\)@\1_Manning.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^premier_press[_.]\(.*\)\.\(.*$\)@\1_PremierPress.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^wordware_publishing[_.]\(.*\)\.\(.*$\)@\1_Wordware.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^wiley_N_sons[_.]\(.*\)\.\(.*$\)@\1_Wiley.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^john_wiley_N_sons[_.]\(.*\)\.\(.*$\)@\1_Wiley.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^wiley_publishing[_.]\(.*\)\.\(.*$\)@\1_Wiley.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^wiley[_.]\(.*\)\.\(.*$\)@\1_Wiley.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^sybex[_.]\(.*\)\.\(.*$\)@\1_Sybex.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^syngress[_.]\(.*\)\.\(.*$\)@\1_Syngress.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^mcgraw_hill[_.]\(.*\)\.\(.*$\)@\1_McGH.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^hungry_minds[_.]\(.*\)\.\(.*$\)@\1_HungryMinds.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^digital_press[_.]\(.*\)\.\(.*$\)@\1_DigitalPress.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^new_riders[_.]\(.*\)\.\(.*$\)@\1_NewRiders.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^wrox[_.]\(.*\)\.\(.*$\)@\1_Wrox.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^artech_house[_.]\(.*\)\.\(.*$\)@\1_ArtechHouse.\2@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^crc_press[_.]\(.*\)\.\(.*$\)@\1_CRCPress.\2@g')"
#-- final-cosmetcs-BKs:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^the[_.]@@i')"


############## Dates-renamings in Filenames modifications: (eg:  xxx_09.07.2010.pdf' -> `100709_xxx.pdf ...):)
#mv -iv  "$fn1"  "$(echo $fn1 | sed -e 's@^./@@;s@\(.*\)_\([0-9]\{4\}\)\(.*\)@\2_\1\3@g')"  ##--date.stamp.prefixing from postfix, so convert:   xxx_1208.txt  -->  1208_xxx.txt
#--!!  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@.*_20\([0-9]\{2\}\)\-\([0-9]\{2\}\)\-\([0-9]\{2\}\)\(.*\)@\1\2\3_Az_Gir437_PoBa\4@g')"   ##-I-  renaming:  PB_Kontoauszug_Giro_2010-05-21_00-35.tsv  -> 100521_Az_Gir437_PoBa_00-35.tsv
#--!!  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@kontoauszug_\([0-9]\{2\}\)\.\([0-9]\{2\}\)\.20\([0-9]\{2\}\)\.\(.*\)@\3\2\1_Az_Gir437_PoBa.\4@g')"   ##-I- renaing  xxx_09.07.2010.pdf --> 100709_xxx.pdf  ;so renaming  kontoauszug_09.07.2010.pdf' -> `100709_Az_Gir437_PoBa.pdf
#--!!  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(.*\)_\([0-9]\+$\)@\2_\1@g')"  #-I- move date-at-END-of-filename to its beginning!

############## Bups,Refs,CPs renaming,...
# find . -regextype posix-egrep -type d -iregex ".*_ref|.*_rf" -exec renFiles1.sh {} \;
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_Rf$@@g' -e 's@_Ref$@@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_RF$@_BP1@g' -e 's@_Ref$@_BP1@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@flg.txt@flg@ig')"



############## Suffixes:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.html@\.htm@g' -e 's@\.PDF@\.pdf@g' )"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.html@\.htm@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.PDF@\.pdf@g')"

############## case-converting:
#-- all-lower-case + no-space  renaming :   mv -iv "$fn1"  "$(echo $fn1 | sed -e   's@  *@-@g' -e  's@.*@\L&@g')"
#-- all-lower-case-renaming:    mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@.*@\L&@g')"
#-- no-space + all-low-letters (replaceing space with '_' , and all lower case):
#for i1 in * ; do echo "$i1" $(echo "$i1" | tr -s  ' ' '_' | tr [[:upper:]] [[:lower:]] ) ; done
	#- /OR sed:
#for i1 in * ; do echo "$i1" $(echo "$i1" | sed -e 's/  */_/g' -e  's/\(.*\)/\L\1/g' ) ; done

############# parameterising sed-cmds: ########################################
##-- replacing $2 with $3  --2DO: for eg . use \\$1 ?? -> test it !
#-	
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's/'$s1'/'$r1'/g')"
########### misc : ###########################################################
##-- OK: Ora09-Doc-Files-renaming, eg:  mv -iv a97297_Ux_admin.pdf   -->  Ux_admin_a97297.pdf
#- mv -iv "$fn1" "$(echo $fn1 | sed -e 's/\([^_]*\)_\(.*\)\.pdf/\2_\1.pdf/')"

###########  direct-renaming files without renFiles1.sh:################################
#- spaces replacing with _
#for ii in *\ * ; do mv -iv "$ii" $(echo $ii | sed -e 's/  */_/g' -e 's/__*/_/g' ) ; done
#- renaming .ksh to .sh
#for ii in *.ksh ; do mv -iv $ii $(echo $ii | sed -e 's/.ksh$/.sh/') ; done
#- csv -> tsv:
#for ii in *.csv ; do mv -v $ii `echo $ii | sed s/csv$/tsv/` ; done
#- .html to .htm
#for ii in *.html ; do mv -iv $ii $(echo $ii | sed -e 's/.html$/.htm/') ; done
# Az: mv 0402_k030.htm -> k030_0402.htm
#for i in *.htm; do mv -v $i `echo $i | sed -e 's/\([^_]*\)_\([^\.]*\).htm/\2_\1.htm/'`;done
#- renaming files: no space + all-low-letters (replaceing space with '_' , and all lower case):
#for i1 in * ; do echo "$i1" $(echo "$i1" | tr -s  ' ' '_' | tr [[:upper:]] [[:lower:]] ) ; done
	#- /OR sed:
#for i1 in * ; do echo "$i1" $(echo "$i1" | sed -e 's/  */_/g' -e  's/\(.*\)/\L\1/g' ) ; done
#- renaming Ausz-files eg: 
#for ff in *_Ausz.htm* ; do  `echo $ff | sed -e "s/\(.*\)_Ausz.*.htm.*/mv -v $ff \1_Az.html/"` ; done  #- is then: 060525_CB_Ausz.htm' -> `060525_CB_Az.h>


