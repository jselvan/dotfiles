$PWSH_CUSTOM_MODULES = "$env:CONFIG\pwsh\modules"
$PWSH_STARTUP_SCRIPTS = "$env:CONFIG\pwsh\scripts"
Import-Module $PWSH_CUSTOM_MODULES\Import-Env.psm1

dotenv ~/.analysis/.env
dotenv $env:CONFIG/.env

echo "Janahan Selvanayagam"
echo (get-content -raw "$env:config\pwsh\assets\luffy.txt")

Import-Module $PWSH_CUSTOM_MODULES\Debug-Python.psm1
Import-Module $PWSH_CUSTOM_MODULES\Test-CommandExists.psm1
Import-Module $PWSH_CUSTOM_MODULES\Add-ToPath.psm1
Import-Module $PWSH_CUSTOM_MODULES\prompt.psm1 -DisableNameChecking
Import-Module $PWSH_CUSTOM_MODULES\which.psm1 -DisableNameChecking
#Import-Module $PWSH_CUSTOM_MODULES\init-conda.psm1 -DisableNameChecking

# . $PWSH_STARTUP_SCRIPTS\custom_commands.ps1
# . $PWSH_STARTUP_SCRIPTS\prompt.ps1
. $PWSH_STARTUP_SCRIPTS\editor.ps1
. $PWSH_STARTUP_SCRIPTS\yazi.ps1
function init-conda() {
    . $PWSH_STARTUP_SCRIPTS\init_conda.ps1
    conda activate simi
}
$profile_ = $profile
$profile = $PSCommandPath 
