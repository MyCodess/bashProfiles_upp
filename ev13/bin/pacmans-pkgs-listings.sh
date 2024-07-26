#!/bin/bash

##--pacman-/arx logs-lisings of installed/All-Repos/Local-packs/syste-managed packages:
##--I-histor of log files basically not needed, but here only for installedPkgs are done !
set -u

cd ${syysTgLogsDP}/ ||  exit 3  ;
mv  ${insPkgsListShortFP}  ./${q_Label00DNOlds}/$($cudts)-${insPkgsListShortFN} ;

##================== dconf-user :
gsettings list-recursively  | sort | uniq >|  dump-gsettings-${USER}-${q_Hostname}-${q_syysTg}-$($cudts).log ;
dconf  dump  /  >|  dump-dconf-${USER}-${q_Hostname}-${q_syysTg}-$($cudts).log  &&  echo  "__generated:   dconf--dump/settings " ;

#################========= installedPkgs-linstings (locally/in-cu-System-pkgs): ###############################
##-- installed-pkgs--short-listing (name+version):
pacman -Q > ${insPkgsListShortFP} && date >> ${insPkgsListShortFP} && echo "__generated:   ${insPkgsListShortFP}" ;

#################========= allPkgs-linstings (Remote/Repos-pkgs): ###############################
##-- all/Repos-pkgs--short-listing (name+version + oneLiner-/short-descp): (if wanted ONLY name+Repo, then use  pacman -Sl  ) :
##--I-history not needed for all-pkg!  otherwise:   cd ${syysTgLogsDP}/ &&  mv  ${allPkgsListShortFP}  ./${q_Label00DNOlds}/$($cudts)-${allPkgsListShortFN}  &&  pacman -Ss > ${allPkgsListShortFP} && date >> ${allPkgsListShortFP} && echo "__generated:   ${allPkgsListShortFP}" ;
pacman -Ss   >|  ${allPkgsListShortFP} && date >> ${allPkgsListShortFP} && echo "__generated:   ${allPkgsListShortFP}" ;

##-- all/Repos-pkgs--long-descpt-listing (full-descprition, but Without Files-Listing:
##--I-history not needed for all-pkg! otherwise:    cd ${syysTgLogsDP}/ &&  mv  ${allPkgsListLongsFP}  ./${q_Label00DNOlds}/$($cudts)-${allPkgsListLongsFN}  &&  pacman -Si > ${allPkgsListLongsFP} && date >> ${allPkgsListLongsFP} && echo "__generated:   ${allPkgsListLongsFP}" ;
pacman -Si  >|  ${allPkgsListLongsFP} && date >> ${allPkgsListLongsFP} && echo "__generated:   ${allPkgsListLongsFP}" ;

