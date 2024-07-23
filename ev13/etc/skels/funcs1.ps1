##_______________ evv-PS1: funcs/cmdlets/.... __________________________

##############################  Lx-cmds-PS1 : ################################
##--!! check also the defaul-ps-aliases for many Lx-cmds !

##----- Kund-ofc1-vw-settings-NW ...:
function setproxys() { $env:HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; $env:HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' }

##----- afg, ... :
function afg ([parameter(mandatory, HelpMessage="search-word-in-aliases+funcs-names+definitions")]  [string]$p1 )  { Get-Command  -ListImported  -CommandType  Alias,Function  |  Out-String -stream | Select-String  "$p1" }
function afgn ([parameter(mandatory, HelpMessage="name-of-Alias/Func-to-search")]  [string]$p1 )  { Get-Command  -Name "*${p1}*"  -ListImported  -CommandType  Alias,Function  |  Sort-Object -Property Name |  Format-Table -Property Name,Parameters,Definition  -Wrap }

##----- env-funcs: exp,g prompt, ...:
function expg  ([parameter(mandatory, HelpMessage="ENV-search-pattern")]  [string]$p1 )  { Get-ChildItem  env: |  Select-String  "$p1" }
function expgn  ([parameter(mandatory, HelpMessage="ENV-search-pattern-in-VarNamesOnly")]  [string]$p1 )  { Get-ChildItem  "env:*$p1*" }
function prompt { (Get-Location).path + ' : '}   ##--evv-prompt
function eplines   { echo $env:PATH.replace(";","`r`n") }  ##--/OR worked-also-only-n as: "`n"  ; /OR really a physical-new-line here inside "" also worked-ok!
function eplineslx { echo $env:PATH.replace(";","`n").replace("C:","/c").replace("\","/") }  ##--Lx-/cyg-format-path-lines
##----- ls/ll :
function  ll   ([string]$path1 = ".")  { Get-ChildItem  $path1 | Sort-Object -Property Name }
function  lla  ([string]$path1 = ".")  { Get-ChildItem  $path1 -Force | Sort-Object -Property Name }

##----- cd:
function cdll   ([string]$path1 = "${env:q_home1}")  { Set-Location "$path1" ; ll }
function cdlla  ([string]$path1 = "${env:q_home1}")  { Set-Location "$path1" ; lla  }
function .. () { cdlla .. }
function ... () { cdlla ../.. }

##------- finds: 
function  find1     ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1 = ".")  { Get-ChildItem  -Path $path1 -Recurse  -Name | Sort-Object }
function  findls1   ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1 = ".")  { Get-ChildItem  -Path $path1 -Recurse | Sort-Object -Property Name | select @{Name="KB Size";Expression={ "{0:N1}" -f ($_.Length / 1KB) }}, FullName, LastWriteTime; }
function  findin1   ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1, [parameter(mandatory)]  [string]$pattern1)  { Get-ChildItem  -Path $path1 -Recurse  -Name -filter *${pattern1}* | Sort-Object }
function  findind1  ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1, [parameter(mandatory)]  [string]$pattern1)  { Get-ChildItem  -Path $path1 -Recurse  -Name -filter *${pattern1}* -Attributes  Directory | Sort-Object }
##--ok1: function  findls1   ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1 = ".")  { Get-ChildItem  $path1 -Recurse  -Name -Length | Sort-Object -Property Name }

##------- greps-finds:
Set-Alias  grepi1 Select-String   ##--??ok?? evtl. not always!? but for piping,.. could ok!?
function  grepi-r  ([parameter(mandatory, HelpMessage="Start-Dir")]  [string]$path1, [parameter(mandatory)]  [string]$pattern1)  { Get-ChildItem  -Path $path1 -Recurse  | Sort-Object | Select-String -Pattern "$pattern1" }

##------- links / SymLinks / ln -s ...:
#-!! Admin-PS is required for all symlink actions!
#- delete a symlink:  (Get-Item  .\mylink1).Delete()
#- redefine/re-assign/new-target-for-link:  just use New-Item as in ln-s func here +  -Force at its end!
function  llalinks  ([string]$path1 = ".")  { Get-ChildItem  $path1 -Force | Sort-Object -Property Name |  Select-Object  name,*target,LinkType,mode }
function  ln-s  ([parameter(mandatory, HelpMessage="link-target-path for SymLink/ln -s")]  [string]$p1, [parameter(mandatory, HelpMessage="link-point")]  [string]$p2)  {  New-Item -ItemType SymbolicLink  -Target "$p1"  -Path  "$p2" }

##------- filesMgms-more-rest_lx:
function  rm-rf ([parameter(mandatory, HelpMessage="DirPAthToRemoveRecursively")]  [string]$p1) { Remove-Item  -Recurse  -Force  -Confirm  "$p1" }  
function  mkdircd  ([parameter(mandatory, HelpMessage="DirPAthToCreate")]  [string]$p1) { mkdir  "$p1"; cd  "$p1"; }  

##------- prj1 , terms1prj, ...:
function  cdprj () { cd  "${env:q_prjDP}" ; lla ; (pwd).path }
function  terms1cod1 () { wt nt -p "winps" `; nt -p "gitb" -d "${env:q_prjDP}" `; nt -p "gitb" -d "${env:q_prjDP}\cod1\nsv1" }

##------- OS-cmds (ps, ...) :
function ps-cpu { get-process |Sort-Object -Property CPU | Format-Table }  ##--: ps sorted by CPU-usage

##------- pythons/devels:
#--funcs-py:
function  pydoc1  ([parameter(mandatory, HelpMessage="Py-Module-Name")]  [string]$module1 )  { python -m pydoc $module1 }

##-------lx-cmds-All-rest-miscs:
function whichll([string]$p1) { (Get-Command -ErrorAction "SilentlyContinue" $p1).path }

##----- mswin-exe-stuff/misc:
Set-Alias bash1 C:\progs2\Git\bin\bash.exe
Set-Alias vi  vim
Set-Alias vi1  vim

##----- upp-funcs: profs, cdupp, ...:
function cdupp { cdlla "$env:q_UPP_DP" }
function vimsprofs()    {gvim  -p  $PROFILE.CurrentUserAllHosts  $env:q_ProfileFP   $env:q_Funcs1FP  }  ##--PS1-prof-of-PS7_ptb !! not std-devpc-PS5 !!
function vimsprof7ps()  {gvim   $PROFILE.CurrentUserAllHosts }  ##--PS1-prof-of-PS7_ptb !! not std-devpc-PS5 !!
function vimsprof5ps()  {gvim   $PROFILE.CurrentUserAllHosts }  ##--PS1-prof-of-PS7_ptb !! not std-devpc-PS5 !!
function msprofiles() {  $PROFILE | Select-Object * }  ##--shows MS-profiles-pathes


#################################################################################################
echo "___ funcs1__END1__ ____"
