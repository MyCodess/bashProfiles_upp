#!/bin/bash

##-- ________ collect/lager for MPs-Renaming, ONLY collects; for REF see other mpxxx.sh files _________
fn1="${1:?USAGE: $0 <filename>}"
##__ echo  

exit 0


echo "____________######ERROR:  You may NOT have reached here !!"  ;   exit 5 ;

##===== 2101_1kk_MPs_rel ,converting 1901+1401 into current 1kk_MPs===================================
##__  mv -inv  "$fn1"   "${fn1//__tgDirDS3/__tgDirDS1}"  ;  ##-- for ii in *__tgDirDS3* ; do mp-renFiles.sh "$ii" ; done
##__  mv -inv  "$fn1"   "${fn1//---[0-9]_/---}"  ;  
##__  mv -inv  "$fn1"  "${fn1//__Y/__tgDirLi3__tgT1__tgGrLi_Oldies1__tgGrRO__Y}"  ;  
##__  mv -inv  "$fn1"   "${fn1//__tgA/__tgAtt}"  ;  
##__  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(.*\)\(D[SH].\)_\(.*\)@\1\3_\2@')"  ##-renamaing from eg  DS1_FG to FG_DS1 with: find . -xdev -name '*D[SH][13]_*' -type d  -exec  mp-renFiles.sh {} \;
##__  mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(.*\)\(Li.\)_\(.*\)@\1\3_\2@')"  ##-renamaing from eg  Li3_FG to FG_Li3 with: find . -xdev -name '*Li[13]_*' -type d  -exec  mp-renFiles.sh {} \;
##__  mv -inv  "$fn1"   "${fn1//AMPs/MPA}"  ;  
##__  mv -inv  "$fn1"   "${fn1//Jazz/Jz}"  ;  
##__  mv -inv  "$fn1"   "DS1_${fn1//_AS/}"  ;  
##__  mv -inv  "$fn1"   "DS3_${fn1//_GD/}"  ;  
##__  new11="$fn1" ;  new11="${new11//Li/Li1}" ; new11="${new11//_AS/}" ;  mv -inv  "$fn1"     "${new11}" ;  
##__  new11="$fn1" ;  new11="${new11//Li/Li3}" ; new11="${new11//_GD/}" ;  mv -inv  "$fn1"     "${new11}" ;  
##__  mv -inv  "$fn1"   "${fn1//__tgGrTr/__tgGrTrance}"  ;  
##---- checks typos rapairings:  
##__  echo mv  -iv  "$fn1"  "$(echo $fn1 | sed -e  's@\([^_]\)_tg@\1__tg@g' )"  ##--II-!!-when __tg missing one _  ! usage:   find  .  -iname "*[^_]_tg*"    -exec  mpFileRen_coll.sh  {} \;  

##===== 1700_1kk_MPs-rel  converting into current 1kk_MPs-2001_rel  convs:   ===============
# mv -inv  "$fn1"     "${fn1//__tgG/__tgGr}"         ##--  find . -iname "*__tgG[^r]*"  -exec  mp-renFiles.sh  {} \;    ##-- in K1 the Genre2-tag was named __tgG   instead now __tgGr !
# mv -inv  "$fn1"     "${fn1//__tgS5/__tgDirLi1}"    ##--  find  .  -iname  "*_tgS5*__tgT[12]*"     -exec  mp-renFiles.sh  {} \;
# mv -inv  "$fn1"     "${fn1//__tgS5/__tgDirDS1}"    ##--  find  .  -iname  "*_tgS5*__tgT[45]*"   -exec  mp-renFiles.sh  {} \;
# mv -inv  "$fn1"     "${fn1//__tgS5/__tgDirDH1}"    ##--  find  .  -iname  "*_tgS5*__tgT[78]*"   -exec  mp-renFiles.sh  {} \;
# mv -inv  "$fn1"     "${fn1//__tgS3/__tgDirLi1}"    ##--  find  .  -iname  "*_tgS3*__tgT[12]*"   -exec  mp-renFiles.sh  {} \;
# mv -inv  "$fn1"     "${fn1//__tgS3/__tgDirDS3}"    ##--  find  .  -iname  "*_tgS3*__tgT[45]*"   -exec  mp-renFiles.sh  {} \;
# mv -inv  "$fn1"     "${fn1//__tgS3/__tgDirDH3}"   ##-- find  .  -iname  "*_tgS3*__tgT[78]*"   -exec  mp-renFiles.sh  {} \;
##=======END--1kk_MPs-1700_rel  converting into cur =====================

############## cu1-actives:
#mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@Track_\(..\)_\(.\+\).mp3@Gianna_Nannini---\2__No\1.mp3@')"   ##--renaming:   Houshmand_Aghili---Aamadam/Track_01_Avalin_Didar.mp3  --> Houshmand_Aghili---Avalin_Didar__No01.mp3
#mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@\(..\).\(.\+\).mp3@Duffy---\2__No\1_BonusCD.mp3@')"   ##--renaming:   Houshmand_Aghili---Aamadam/01_Che_Khabar_Az_Iran.mp3' -> Houshmand_Aghili---Che_Khabar_Az_Iran__No01.mp3
#mv  "$fn1"  "$(echo $fn1 | sed -e 's@__19@__Y19@g')"  ##- year-tag: __1995 --> __Y1995
#mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@---peter_fox__@---@')"

############## MPs-commmon-done-active:
##--- MPs-kk:
#mv -inv  "$fn1"     "${fn1//_g1/_GD}"   ##-- find . -type d -name "*_g1"  -exec  mp-renFiles.sh {}  \;
#mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@Track_\(..\)_\(.\+\).mp3@Houshmand_Aghili---\2__No\1.mp3@')"   ##--renaming:   Houshmand_Aghili---Aamadam/Track_01_Avalin_Didar.mp3  --> Houshmand_Aghili---Avalin_Didar__No01.mp3
#mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@\(..\)_\(.\+\).mp3@Houshmand_Aghili---\2__No\1.mp3@')"   ##--renaming:   Houshmand_Aghili---Aamadam/01_Che_Khabar_Az_Iran.mp3' -> Houshmand_Aghili---Che_Khabar_Az_Iran__No01.mp3
#mv -iv "$fn1" Mano_Negra---"$fn1"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_G1$@_GD@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_Track@__No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_*AudioTrack_*@La_Sonora_Matancera_XXsong_No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Trak@XXalbum_CD1__No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Lovers_Rock_@Lovers_Rock__WAS__No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\([0-9][0-9]\)---\(.*\)\.mp3@\2__No\1.mp3@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Sampler@PopCharts__Sampler@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Listen_@Li_@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@Latin_@Lat_@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@[0-9][0-9]---\(.*\)\.mp3@\1__No&@g')"
# for cntrl-char eg:  sed 's/'`echo "\032"`'/Ctrl-Z/g'
#- case-converting: lower-case-renaming:   mv -iv "$fn1"  "$(echo $fn1 | sed -e 's@.*@\L&@')"
##-------
##--- MPs-Carol-renamings:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(.*\)---\(No..\)_\(.*\).mp3@\1---\3__\2.mp3@')"  ##-!- moving  "---NoXX_"  to the end
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^@tgac__@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([0-9][0-9]\)_\(.*\).mp3@\2__No\1.mp3@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\(^[^_]*_[^_]*\)_@\1---@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@/\([0-9][0-9]\)_\(.*\)---@/\2---\1__@g')"   ##-I_ Classicals-No-Before-Title !! -WITH-find: find music_cl/Classical/ISANG_YUN---Selected_Works_For_Clarinet/ -iname "*.mp3" -exec renFiles.sh {} \;
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([0-9][0-9]\)_\(.*\)---@\2---\1__@g')"   ##-I_ Classicals-No-Before-Title !! -WITH-for-loop
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@XXsinger@XXartist@')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@AudioTrack_@XXsong@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@__*No@__No@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@_\([0-9][0-9]\).mp3@__No\1.mp3@g')"
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([0-9][0-9]\)_\(.*\).wma@Charles_Aznavour---\2__\1.wma@g')"

############ MPs-renaming pre 0909-scripted: ###############################################
##--------- from MPs.txt-notes, std-sed-MP-lines:
#- 1.noSpacePlus.sed:
#mv -iv "$fn1" "$(echo "$fn1" | sed -e 's/  */_/g' -e 's/___*/__/g' -e 's/_\./\./g' -e 's/\._/_/g' -e 's/_$//' )"
#- 3.delimiters.keep.sed:
#mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_-_@---@g')"
#- 6.spec.char.del.sed:    
#mv -iv "$fn1" $(echo "$fn1" | sed  -e s@[^[:alnum:]/_.-]@_@g)
#- 9.delimiters.clean.sed:
#mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_*----*_*@---@g')"
#- 12.MP3.2.mp3.sed:
#mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.MP3@\.mp3@')"

##--------- individual-MP-stuffs:
#echo mv -iv "$fn1" $(echo "$fn1" | sed  -e s/[^ [:alnum:]_./-]/_/g -e 's/__*/_/g' -e 's/_\./\./g' -e 's/\._/_/g' -e 's/_-_*/_/g')
#- mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\---[^[:alpha:]]*@---@')"	#-no-track-nr.
#- mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([[:digit:]]*\)-\(.*\).mp3@\2---XXsong_\1.mp3@')"	#- sampler:  11-Ebi.mp3  --> Ebi---XXsong_11.mp3
#- mv -iv "$fn1" "$(echo $fn1 | sed -e 's@\.MP3@\.mp3@')"
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_-_@---@g')"
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_-_@---@g' -e 's@)@@g' )"
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_*----*_*@---@g')"
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@SongXX@XXsong@')"
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_[Nn]_@_and_@')"
#- echo mv -iv "$fn1"  ---  $(echo "$fn1" | sed  -e s@[^[:alnum:]/._-]@_@g)
##-! movinf _N_ or _F_ to the End !! :
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@\(_[NnFf]_.*\)---\(.*\).mp3@---\2_\1.mp3@')"  ##-!!-2Do: if _N_ twice, also in DirName !!!
#- mv -iv "$fn1" "$(echo $fn1 | sed -e 's@^\([[:digit:]]*\).*@'$s1'_\1.mp3@')"  #-I- with param, for funny unknown songs
#-- ripperX-tracknumer-problem: 2lines
#-mv -iv "$fn1" "$(echo $fn1 | sed -e 's@[0-9][0-9]\.mp3@\.mp3@')"
#-mv -iv "$fn1" "$(echo $fn1 | sed -e 's@track\([0-9]\)\.mp3@track0\1\.mp3@')"
##---- misc/tr-MPs:
#- mv -iv "$fn1"   "$(echo $fn1 | sed -e 's@_Sampler@__Sampler@')"

########## USAGES-exp /finding bad filenames: ##########
#- finding all playlists:  find . -regextype posix-extended  -iregex ".*\.m3u|.*\.pls"
#-		/OR with  renaming:  find . -regextype posix-extended  -iregex ".*\.m3u|.*\.pls" -exec renFiles.sh {} \;
#- finding all irregular filenames:  find . -regextype posix-basic  -regex ".*[^a-zA-Z._0-9 /-].*" -ls
#- find . -regextype posix-extended   -regex ".*[^a-zA-Z._0-9 /-].*"          ##- if wanted:   -exec renFiles.sh {} \;


############## special chars: !!PREREQ: NO-Space in FileName !!  #########################
# choose the specials, which needed: if NOT working, must replace each special char seperately!:
##--! PROBLEM with \' , must be ebraced in "..." as  -e "s/'//g" .so best: replace it seperately as:
#mv -iv "$fn1" $(echo "$fn1" | sed  -e "s/'//g")
##-- rest of special char (nospace, and no \' ): 
##-OK-but each seperate char as sed-param:
	#-  mv -iv "$fn1" $(echo "$fn1" | sed  -e 's/,//g' -e 's/(//g' -e 's/)//g' -e 's/\[//g' -e 's/\]//g')
##-OK-all in one sed-param, all special-chars listed. ( ' MUST be seperately, embraced by " !! so 2 sed-params !)
	#- mv -iv "$fn1" $(echo "$fn1" | sed  -e "s/'//g" -e 's/[]: &;,+?()\"=[]/_/g' -e 's/__*/_/g')
##-!best: (check it); all in one sed-param: replace all NON-alphaNums and /_.-     : CHECKIT:
#-  mv -iv "$fn1" $(echo "$fn1" | sed  -e s@[^[:alnum:]/_.-]@_@g)


