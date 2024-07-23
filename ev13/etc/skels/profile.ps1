##--I- put this in /c/Users/DKX8H1N/Documents/WindowsPowerShell to invoke the msw-evv-prof:  prof1.ps1 !

################### evv-call-only : ###################################################
##----- setevv:
$env:q_ProfileFN="prof1.ps1"
$env:q_ProfileFD="${env:USERPROFILE}\1Hm\etc"
$env:q_ProfileFP="${env:q_ProfileFD}\${env:q_ProfileFN}"
$env:q_Funcs1FN="funcs1.ps1"
$env:q_Funcs1FP="${env:q_ProfileFD}\${env:q_Funcs1FN}"
function sus1() { .  ${env:q_ProfileFP} }        ##--!!-MUST be sourced, so:  .  sus1
##--  
.   sus1

############################## prev/1coll/... : ###################################
##======== sus1 variants :
##--  Set-Alias sus1  ${env:q_ProfileFP}       ##--!!-MUST be sourced, so:  .  sus1
##--OK1:   Set-Alias sus1  ${env:USERPROFILE}\ofc1\bin\prof1.ps1  ##--!!-MUST call as sourced, so:  .  sus1
##--OK1:   .    ${env:USERPROFILE}\ofc1\bin\prof1.ps1
##--OK2:  function sus1() { .  ${env:USERPROFILE}\ofc1\bin\prof1.ps1 }     ##--!!-MUST call as sourced, so:  .  sus1
