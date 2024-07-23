echo "___ prof1__STA1__ ____"
##--I- add this line in Win-PS-Profile:   function sus1() { .    ${env:USERPROFILE}\ofc1\bin\prof1.ps1 }   ##--inq-your-PS-Profiles: $PROFILE bzw.-all:  $PROFILE | select-object *  


#####  ==========  Env-OS/Sys : #######################################################
##--- mynames (not-envVars, but just shell/script-vars):
$myFP11 = $MyInvocation.MyCommand.Path
$myDP11 = Split-Path $myFP11 -Parent
##--- $env:HOME nts: use überall only $env:q_home1  which is pre-set to $env:USERPROFILE :
$env:q_home1="$env:USERPROFILE"
#-II-  use just ${env:USERPROFILE} instead HOME (and this re-defined here as q_home1) ! ist sicherer und überall definiert! otherwise do:
##--OK2-for-both-devpc1 + stdpc1-with-HOMESHARE :  if (!${env:HOME})  { $env:HOME = "${env:USERPROFILE}" } ; if (${env:HOMESHARE})  { $env:HOME = "${env:HOMESHARE}" }
##--OK1:  if (!${env:HOME})  { $env:HOME = "${env:HOMEDRIVE}${env:HOMEPATH}" } ; if (${env:HOMESHARE})  { $env:HOME = "${env:HOMESHARE}" }
##---------------------
##________________________________________  ___________________________


#####  ==========  Env-evv/upp: #######################################################
##----- ENVs_Kund_vwfs_devpc1...:

##----- ENVs_upp:
$env:q_UPP_DN="up1"
$env:q_UPP_DP="${env:q_home1}\${env:q_UPP_DN}"   ##-- ; $env:q_UPP_DP="${env:HOMESHARE}\up1" ;
$env:TP1DP="T:\t1_RF"
$env:vaarAuDP="${env:TP1DP}\varu\varau"

##----- ENVs_ofc1_prj+dvl: (needed in winPS)
$env:q_prjID="ofc1"
$env:q_prjDP="${env:q_home1}\${env:q_prjID}"

##----- ENVs_py_ofc1  (needed in winPS):
$env:q_prjVarDP="${env:q_prjDP}\var1"
$env:PYTHONPYCACHEPREFIX="${env:q_prjVarDP}\0pycs"
$env:pyvar_DP="${env:q_prjVarD}\py1var"
##________________________________________  ___________________________

##----- ctrl-a, ctrl-e, ... as in bash-term:
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs


##__OK1:  cd $myDP11 ; .   .\funcs1.ps1  ; cd ~ ;
. ${myDP11}\funcs1.ps1

$evv_done1 = 1
echo "___ prof1__END1__ ____"

