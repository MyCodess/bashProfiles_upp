#!/bin/bash

#####  ==========  nts:
#-!! for git auth (eg new Token): you MUST edit ~/.git-credentials , if git config [--global] credential.helper is store !! ()
#-!! the envVar GH_TOKEN  works ONLY for gh-cmds, BUT NOT for direct git-cmds !!
##________________________________________  ___________________________


##__ set -x
usag11="USAGE:   $0   <path-to-loc-git-repo/clone>"
locRepo11=${1:?"$usag11"}

echo; echo "_______status-check: __________________________";
PS4="________ "
pauseCmd1="read -p 'is-OK?--[Enter/Ctrl-C]:'"
pauseCmd1='echo   _____go-on--without-pause_____'  ##--II-for pause between steps comment out this line!

echo ${GH_TOKEN:?"set the GH_TOKEN env-var before starting me!"}
#$($pauseCmd1)
##_ cdlla  /up1/varu/varau/wks/gh1/repo1  || exit 3
cdlla  ${locRepo11}  || exit 3
##__  gh repo list
git remote -v
git status
$pauseCmd1

echo; echo "_______change+commit:__________________________";
git  switch br1
el1d "br1-mod" >> f1_flg.txt
git  commit -a -m "br1-commit--for-pr"
git  push     ##__ [ -v   --set-upstream origin br1 ]
$pauseCmd1

echo; echo "_______pull-request-handling: _________________";
gh  pr  create  --title  "gh_cmd-pr1--$($cudts2)"  --body "$($cudts2) : gh_cmd-pr-created on 2209arx for br1-merge-into-main"
gh  pr  merge -m br1

##__  $pauseCmd1
##__  echo  "----------- if like: create+delete repoXX : -----------------------"
##__  expg  GH_TOK
##__  gh  repo  create  -d "gh-cmd-repo-created-$($cudts2)"  --public  repo61
##__  gh  repo  delete  --yes   repo61

