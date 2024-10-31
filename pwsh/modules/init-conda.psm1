function Init-Conda() {
###################
# CONDA SETUP
Add-ToPath $env:CONDA_ROOT
Add-ToPath $env:CONDA_BIN
Import-Module $env:CONDA_SHELL_BIN\conda.psm1
. $env:CONDA_SHELL_BIN\conda-hook.ps1
$Env:_CONDA_ROOT = $env:CONDA_ROOT
$Env:_CONDA_EXE = "$env:_CONDA_ROOT\conda.exe"


if ($env:default_conda_env -and (test-commandexists conda)) {
    conda activate $env:default_conda_env
}
###################
}
