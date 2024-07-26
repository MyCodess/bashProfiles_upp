___________________ gits cmds for loc-wk: w1/evv/prj/syncs/... : _______________________________



#####  ==========  up1/w1/dres/-gits-qckys , 1coll:
    cdgtw1repos   ##-- cdlla /up1/varu/varau/wks/gits_w1

    --- evv1 / up1:
    rm -rf /up1/mnt/VARUfs/varu/varau/wks/gits_w1/up1_git/ev13/ ; cp -a  /up1/.ev13/  /up1/mnt/VARUfs/varu/varau/wks/gits_w1/up1_git/ev13/  ##-/OR:
    #-/OR:  rsync  -n  -avO  --delete   /up1/.ev13/  /up1/mnt/VARUfs/varu/varau/wks/gits_w1/up1_git/ev13/
    #-/OR:  rsync  -n  -v  -rtlHO  --modify-window=5  --delete   /up1/.ev13/  /up1/mnt/VARUfs/varu/varau/wks/gits_w1/up1_git/ev13/
    cdgtw1repos ; cdlla up1_git/ ;
    expg TOK ; git status; [git add  . ] ; git commit -a -m "bins-added ; git push ;
    
    --- dres:
    rm -rf /up1/mnt/VARUfs/varu/varau/wks/gits_w1/dres_git/dres/
    cp -a  /up1/w1/dc1K/dres/  /up1/mnt/VARUfs/varu/varau/wks/gits_w1/dres_git/dres/
    #-/OR:  rsyn -n -av --delete  /up1/w1/dc1K/dres/  /up1/mnt/VARUfs/varu/varau/wks/gits_w1/dres_git/dres/  ##--/OR just rm + cp -a
    cdgtw1repos ; cdlla   dres_git ;
    expg TOK ; git status; git commit -a -m "new-dnts" ; git push ;
##________________________________________  ___________________________


#####  ==========  dummys-gits:
    gb1.sh   /up1/varu/varau/wks/gh1/repo1
    gb1.sh   /up1/varu/varau/wks/gh1/syncFolders1/
##________________________________________  ___________________________

