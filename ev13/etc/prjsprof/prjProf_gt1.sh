set -a
#-- myname.settings:
export myname_org_cu="${BASH_SOURCE[0]##*/}"
myname_cu=${myname_org_cu//./_}
declare -xi ${myname_cu}=${!myname_cu:-0}  ##- int-counter
psl  "${myname_org_cu}"
##----------------------------END--myname_cu

#-------- prj-global-IDs/tags of PRJ : -----------------
prjTag=gt  ##--II- name-abbreviated, short-tag
prjNo=1    ##--II- curren No assigned; no meaning/relation to ver/...; nur fuer eindeutigkeit...
prjID=${prjTag}${prjNo}  ##--II- MAIN-Prj-ID/Name/Ref.ID/... used in ...
SW1Name=git
SW1Tag=Gits  ##__ReDo--org1-right-for-real-bigger-prj:    SW1Tag=${prjTag^}              ##--I-convert first char to uppercase! see man bash /"Case modification"  /OR  /\^\^   !
SW1NameID=${SW1Name}${prjNo}   ##--II- NOT-really-used, because APP! is already the global topic of the current project ! redundant? or just descriptive!?
##--- L2-vars
prjID_active1="${prjID}"    ##--II-setting the active prj to this one!

#---------- specifices/addiotional-prj-DPs...:


#-- mynames-cu-final:
(( ${myname_cu}+=1 ))
pel  "${myname_org_cu} : ${!myname_cu}"

