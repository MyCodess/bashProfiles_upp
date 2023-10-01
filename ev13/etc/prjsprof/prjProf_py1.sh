set  -u
set  -a
##--1org-was!?!?:  myname.settings: myname_org_cu="${BASH_SOURCE[0]##*/}" ; myname_cu=${myname_org_cu//./_} ; declare -xi ${myname_cu}=${!myname_cu:-0} ##- int-counter ; q_pls1  "${myname_org_cu}"
q_pls1  "${BASH_SOURCE[0]##*/}"

#-------- prj-global-IDs/tags of PRJ : -----------------
prjTag=py  ##--II- name-abbreviated, short-tag
prjNo=1    ##--II- curren No assigned; no meaning/relation to ver/...; nur fuer eindeutigkeit...
prjID=${prjTag}${prjNo}  ##--II- MAIN-Prj-ID/Name/Ref.ID/... used in ...
SW1Name=python      ##--II- very General-Topic-/technical-Name. eher descriptive, not really used !
SW1Tag=${prjTag^}              ##--I-convert first char to uppercase! see man bash /"Case modification"  /OR  /\^\^   !
SW1NameID=${SW1Name}${prjNo}   ##--II- NOT-really-used, because APP! is already the global topic of the current project ! redundant? or just descriptive!?
##--- L2-vars
prjID_active1="${prjID}"    ##--II-setting the active prj to this one!

#---------- specifices/addiotional-prj-DPs...:


#--1org_was!?!?:   mynames-cu-final: (( ${myname_cu}+=1 )) ; q_ple1  "${myname_org_cu} : ${!myname_cu}"
q_ple1  "${BASH_SOURCE[0]##*/}"

