##--I- bup of etcu-rest, which is not in etcu, but still under home!
set -u
set -C  #noclobber

date11=$($cuds)
targetDP="${ProgsResW1DP}/HomiesBups_BMs_1kk/${date11}-${USER}-homesy"  ;
[[ ! -d ${targetDP} ]] && ( mkdir -v  ${targetDP} || exit 3 )  ; ##--I- extra keine -p ! its root must already exist, otherwise exit!!
cd ${targetDP} || exit 3

cp  -iv  --parents  --preserve=timestamp  ${filesBM1_FP}  ${IntBM1_FP}  ${IntBM2_FP}  ./
cp  -iv  --parents  --preserve=timestamp  ~/.config/vivaldi/Default/Preferences   ./
cp  -iv  --parents  --preserve=timestamp  ~/.config/chromium/Default/Preferences   ./

##--OK-if-no-VARs-using:   =================================
#cp  -iv  --parents  --preserve=timestamp  ~/.config/vivaldi/Default/Bookmarks  ~/.config/vivaldi/Default/Preferences     ./
#cp  -iv  --parents  --preserve=timestamp  ~/.config/chromium/Default/Bookmarks  ~/.config/chromium/Default/Preferences   ./


