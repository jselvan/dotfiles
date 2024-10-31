. $PWSH_STARTUP_SCRIPTS\prompt.ps1
set-alias afs Activate-FancyShell
$has_posh = test-commandexists oh-my-posh 
$use_posh = $env:USE_POSH -ne "no"
if ($has_posh -and $use_posh) {
    afs $env:POSH_THEME
} else {
   Activate-DefaultShell
}
