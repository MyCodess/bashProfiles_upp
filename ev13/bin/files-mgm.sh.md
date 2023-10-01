__________________  files-mgm.sh.txt , trees, sizes, copying, movin, ... : _______________________________________
exit 3


#####  ==========  DIR-tree-mirroring/....: 
#- dir-structure mirrorong with tree (instead of find): (copy dir-tree only, empty)
mkdir -p $(cd Source-DIR  && tree -dif --noreport)  ##--!use also -L /Level if not all dir-depth is wanted !
##________________________________________  ___________________________


#####  ==========  merging two DIRs/trees :

	_______:  -- REQs/nts:
	- so two DIRs have same structure, but contain different files/leaves AND NO-common-files  (as for MPs-nps1 integrating into MPs1):
	-! DIFF :  merge-as-COPY-src-into-dest   <--->  merge-as-MOVE-src-into-dest (eg, when on same filesystem, to avoid copying!)
	-! nts: hardlinks-solutions does NOT work, if dest on exfat/fat32 !! they do NOT support hard-/soft-links !
	-if common-files in src and dest, then for "cp" without -n and play with -u ,... ! see man cp !

	_______:  -- COPY src to dest  (eg, when they are anyway on two different partitions!):
	- cp  -anv  src/*   dest/     ##--merges src into dest-dir without common-files. it copies realy all files!
	- rsync  -ax   src/    dest/

	_______:  -- MOVE src to dest  (eg, when they are on the same partitions, to avoid copying! dest may NOT be exfat/fat32 !i no hardlink-support !):
	- mv src <same-partition-as-dst due to: cp -l >  ;  cp  -anv -l  src/*   dest/   ##--with -l: only inode-copying into src/ !  then:  rm -rf src/ ; /OR even into new dir: cp  -anv -l  src1/*   src2/*  dest/
	- rsync  -ax  --link-dest=dir1/   src/  dest/   ##--2chk !
	- tar OK:    cd $srcDir  ; tar -cf -  .  | tar  -C  $destDir  -xf -
##________________________________________  ___________________________


#####  ==========  sizes/du/MB-space/...
- du -m --max-depth=5 .[[:alnum:]][[:alnum:]]* | sort -n    ;  findin $uueNoBupFlagFN
- total-sizes of all tree-directories :  tree -n   --du -fi | sed 's/[^[:digit:]]*//'  |  sort -n   ##see man tree ! for --du it MUST read the whole tree! so does NOT work with "-L x" or -d ,...
##________________________________________  ___________________________


#####  ==========  zipsListing:  listing the content of all tar/zip/tgz-files in a tree:

	_______:  find-only-method: (all listings in one log-file):
	- find .  \( -iregex ".*.tgz\|.*.tar.gz\|.*.tar" -printf "\n\n\n===== %p :\n" -exec tar -tvf {} \; \) -o \( -iname "*.zip" -printf "\n\n\n===== %p :\n" -exec unzip -l {} \; \)  > zips.toc.log
	- /OR more variations:
	- find . \( -iname "*.tgz" -exec tar -tvf {} \; \) -o \( -iname "*.zip" -exec unzip -l {} \; \)  > zips.toc.log
	- find . \( -iregex ".*.tgz\|.*.tar.gz\|.*.tar"  -exec tar -tvf {} \; \) -o \( -iname "*.zip" -exec unzip -l {} \; \)  > zips.toc.log

	_______:  function based .... (eg defined in a script listZips.sh), and writing one logfile pro zip-file:
	- USAGE eg: find . -iregex ".*.tgz\|.*.tar.gz\|.*.tar\|.*.zip" -exec listZips.sh {} \;
	with listZips.sh : 
	shopt -s extglob
	-- without casei-construct :
	#listit(){ _fp="$1"; ( [[ ${_fp} == "*.tar|*.tgz|*.tar.gz" ]] && tar -tvf ${_fp} ; [[ ${_fp} == *.zip ]] && unzip -l ${_fp} ) > ${_fp}.toc.log; echo  ${_fp}.toc.log; } ; listit "$1"
	-- /OR with case-construct:
	listit(){ _fp="$1" ; case  ${_fp} in ; *.tar|*.tgz|*.tar.gz) tar -tvf ${_fp};; *.zip) unzip -l ${_fp};; esac > ${_fp}.toc.log ; } ; listit "$1"
##________________________________________  ___________________________


#####  ==========  tests-dir/files/tree...:

	_______:  test.dummy.files.generating:
	- severral small files:   for (( ii=1 ; ii<10 ; ii++)); do echo "$ii $ii $ii dummy-file" > ${ii}.txt; done
	  and also in a subdir, if dir.tree needed:
	  mkdircd d1; for (( ii=10 ; ii<100 ; ii=ii+10)); do echo "$ii $ii $ii dummy-file" > ${ii}_d1.txt; done
	- on file with numbered-lines:  for (( ii=100; ii<1000; ii+=100 )); do echo $ii; done >| t1.txt
##________________________________________  ___________________________


#####  ==========  Filenames-renaming/listing of nonUue-names :

    find  .  -xdev  -depth  -regextype posix-extended  \( -ipath "*ProgsRes*" -o -ipath "*Imgs_L1NWs*" \)  -prune -o  -regex  ".*[^[:alnum:]/_.-].*" -ls   ##--find all non-alnum-files !
    dry11=1  find  .  -xdev  -depth  -regextype posix-extended  \( -ipath "*ProgsRes*" -o -ipath "*Imgs_L1NWs*" \)  -prune -o  -regex  ".*[^[:alnum:]/_.-].*"  -exec  renAlnum1.sh  {} \;
    find .  -depth -ipath "*Imgs_L1NWs*"  -prune -o -exec renFilesUue.sh -sv {} \;
    find .  -depth  -regextype posix-extended   -regex  ".*[^[:alnum:]/_.-].*"  ;  ##--find-all-NON-alnum-NONuue-files; regex considers the whole path, so why also "/"
    findin . swp -ok rm -v {} \; ##--delete all vim-swp-files without interactions !
    find . -xdev  -regextype posix-extended   -iregex '.*~[0-9]+~|.*swp'   -ok  rm  -v   --one-file-system  {} \;
##________________________________________  ___________________________


#####  ==========  cleanings ...:
    alias rmautobackups1="find . -xdev  -regextype  posix-extended  -iregex '.*~[0-9]+~|.*swp'  -ok  rm  -v   --one-file-system  {} \;"  ##--I-remove all           auto-backup-files as of vim/emacs/cp/mv/... ; directories are here not deleted, but better, do it manually for directories! -f with rm riskant here!
    alias rmswp1="find .  -xdev -iname '*swp' -exec  rm  -iv   --one-file-system  {} \;"
--
##________________________________________  ___________________________

