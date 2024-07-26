##=============== w_CP-READONLY-remount/rebind into another DIR:
	cd ${q_UppDP}
	##--rt (OR assign rights in fstab to users !?):
	#-!!- options can NOT be combined with --bind !! so must be two seperate cmdlines, with rebound!! see man mount !!
	mount --bind   /up1/mnt/T1fs_loc/w_vo17_CP   /up1/media/med1_CP
	mount  -o remount,ro,bind  /mnt/T1fs_loc/w_vo17_CP  /up1/media/med1_CP
	##--u1:
	#--II-is already there:   cdup1 && ln -s  /up1/media/med1_CP   w_CP_readOnly
	cd ${q_UppDP}  &&  rm ./w  && ln -s w_CP_readOnly  w ;    ##-- (old: cdup1 && rm ./w  ./w_CP &&  ln -s /up1/media/med1_CP  ./w_CP &&   ln -s  ./w_CP  ./w)
	ls -la  ${w1DP}/;
	ls -la  ${q_UppDP}/w_CP_readOnly/

