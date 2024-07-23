______________________ PS1-profiles-stuff_1coll : prev/olders/tips/.... : ____________________________

##------- prompt-settings so that you can open new tabs in the same DIR as prev-tab:
##__  ##-- https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory  :  Opening a tab or pane in the same directory in Windows Terminal :
function prompt {
	$loc = $executionContext.SessionState.Path.CurrentLocation;
	$out = ""
	if ($loc.Provider.Name -eq "FileSystem") {
		$out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
	}
	$out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
	return $out
}
##-----------------------------------------------------------------------

##--- prompts-evv1-OK1:  function prompt { (Get-Location).ProviderPath + ' : '}
#-ok1:  function prompt { (Get-Location).path + ' : '}
#-ok1:  function prompt { 'ev1: ' + (Get-Location) + ' : '}
