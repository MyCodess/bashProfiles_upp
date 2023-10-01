##_______________________ upp into git/GitHub _________________________________



#####  ==========  /:231001 :  

    [u1@2209arx up1_git]$ date ; pwd ;
    /up1/varu/varau/wks/gits_w1/up1_git
    2023-10-01T18:00:50 CEST

    [u1@2209arx up1_git]$ gh repo create -d "bash_profiles_upp"  --public  bashProfiles_upp
    Created repository MyCodess/bashProfiles_upp on GitHub

    [u1@2209arx up1_git]$ cp -a /up1/.ev13/  ev13
    [u1@2209arx up1_git]$ git init
    [u1@2209arx up1_git]$ git branch -m main  ##-renaming master to main for github ! could have done: git config --global init.defaultBranch <name>
    [u1@2209arx up1_git]$ git remote add origin git@github.com:MyCodess/bashProfiles_upp.git
    [u1@2209arx up1_git]$ git add .
    [u1@2209arx up1_git]$ git commit -m "initial-commit-evv"

    [u1@2209arx up1_git]$ git switch -c wk1
    [u1@2209arx up1_git]$ git push -u origin wk1  ##--push my new local-branch to the remoteRepo as a new branch and sync them !
    [u1@2209arx up1_git]$ gh  pr  create  --title  "nts-more-pullReq--$($cudts2)" --body "$($cudts2) : more-dnts, pl. merge wk1-branch-into-main"

##________________________________________  ___________________________


#####  ==========  /:231001 :  github-hints cAp:

    https://github.com/MyCodess/bashProfiles_upp

    --- Quick setup — if you’ve done this kind of thing before
    HTTPS or SSH	git@github.com:MyCodess/bashProfiles_upp.git
    Get started by creating a new file or uploading an existing file. We recommend every repository include a README, LICENSE, and .gitignore.

    --- ... or create a new repository on the command line
    echo "# bashProfiles_upp" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin git@github.com:MyCodess/bashProfiles_upp.git
    git push -u origin main

    --- ... or push an existing repository from the command line
    git remote add origin git@github.com:MyCodess/bashProfiles_upp.git
    git branch -M main
    git push -u origin main
##________________________________________  ___________________________

