__________________  finds-greps-seds.sh.txt : ________________________________
exit 3


--############## greps -only : ###############################################
#####  ==========  greps-allg:
- duplicated/repeated/redundant lines in a file (the repeated line is printed n time):
	while read ll1 ; do cc1=$(grep -c "$ll1" ./links.txt); (( $cc1 > 1)) && echo "$cc1  $ll1" ; done < ./links.txt
##________________________________________  ___________________________


#####  ==========  grep  abs/wpads/...:
#- AdrTel-search, cyg-grep/gnu-grep-2.5.1 in win, eg. 017788xxx:  
grep -Eir --include "*.txt" "4[ /-]*4[ /-]*6[ /-]*8[ /-]*5[ /-]*3"   W:\MEs\WPad\ABs
grep -i '2 *9 *0 *0' *'
find .  -regextype  posix-extended  -iregex ".*-20[[:digit:]-]*"  ##--using-classes, find files with dateTimeStamp pf 20xxxx-xxxx (but not only 2004arx ... )
##________________________________________  ___________________________


--############## finds-only : ################################################
#####  ==========  finds-filesMgms/...:
find-all-NON-txts-types in dnts (img/bins/...):   cddnts;   find . -type f ! -iregex ".*.md\|.*.txt\|.*.sh\|.*.rst\|.*.sql\|.*.bat\|.*.reg\|.*.py\|.*.logy\|.*.htm.*\|.*.ps1\|.*.cfg"
find .  -type f  \!  -iregex ".*.md\|.*.rst\|.*.txt\|.*.log\|.*.sh\|.*.reg\|.*.py\|.*.sql\|.*.html"
find .  -type f  -ls  | grepi -v -E '.*\.md|.*\.sh|.*\.txt|.*\.log|.*\.rst'   ##--find-all-non-text-files ! better: do it with: -exec file -b --mime-type {} \; (in a small script with if-abfrage ...!)
find ./0MPA_G0find   -regextype  posix-extended  -xdev   -iregex  ".*(opus|mp3)"  | wc -l
#- for w:  rw-for all:
find . -type d -exec chmod 777 {} \;
find . -type f -exec chmod 666 {} \;
#- remove all empty DIRs:
find . -depth -type d -empty -exec rmdir {} \;
##________________________________________  ___________________________


#####  ==========  admins.finds for bups/mv/ren/...:
#-- moving all files in subdirs to the current-dir:
find . -type f -exec mv -iv {} . \;
find . -regextype posix-egrep -type d -iregex ".*_ref|.*_rf" -exec renFiles.sh {} \;
#-- cache and trash dirs listing: prints out the cache-/trash-dir ITSELF, but NOT its contents! only on current filesystem/xdev:
find . -regextype posix-extended  -xdev -type d -iregex ".*cache.*|.*trash.**" -print -prune ;   ##-I-more details then -ls instead of -print)  
#--!! with sizes of cache/trash-dirs Only on current filesystem:
find / -regextype posix-extended -xdev  -type d -iregex ".*cache.*|.*trash.**"  -prune -exec du -sm {} \;
#-- find all broken links:
find . -type l | (while read FN ; do test -e "$FN" || ls -ld "$FN"; done)
##________________________________________  ___________________________


#####  ==========  devel-finds/greps/tree/searchs/...:
#- search in all jar files.....
for %i in (*.jar) do jar -tvf %i | grep FILENAME
--############## sed-only : ##################################################
##________________________________________  ___________________________


#####  ==========  sed-quickies-common:
# reverse order of lines (emulates "tac"): sed '1!G;h;$!d'  /OR  sed -n '1!G;h;$p'  ##-bug/feature in HHsed v1.5 causes blank lines to be deleted
##________________________________________  ___________________________

