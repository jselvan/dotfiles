function Activate-DefaultShell {# $prompt_symbol = "λ"
    $prompt_symbol = [char]8734

# Pre assign the hooks so the first run of cmder gets a working prompt.
    [ScriptBlock]$PrePrompt = {
        if ( $Env:CONDA_PROMPT_MODIFIER ){
             $Env:CONDA_PROMPT_MODIFIER | write-host -nonewline
        }
    }
    [ScriptBlock]$PostPrompt = {}
    [ScriptBlock]$MyPrompt = {
        $Host.UI.RawUI.ForegroundColor = "White"
        Microsoft.PowerShell.Utility\Write-Host $pwd.ProviderPath -NoNewLine -ForegroundColor Green
    }

    [ScriptBlock]$Prompt = {
        $realLASTEXITCODE = $LASTEXITCODE
        $host.UI.RawUI.WindowTitle = Microsoft.PowerShell.Management\Split-Path $pwd.ProviderPath -Leaf
        PrePrompt | Microsoft.PowerShell.Utility\Write-Host -NoNewline
        MyPrompt
        Microsoft.PowerShell.Utility\Write-Host "`n$prompt_symbol " -NoNewLine -ForegroundColor "DarkGray"
        PostPrompt | Microsoft.PowerShell.Utility\Write-Host -NoNewline
        $global:LASTEXITCODE = $realLASTEXITCODE
        return " "
    }

# Once Created these code blocks cannot be overwritten
    Set-Item -Path function:\PrePrompt   -Value $PrePrompt
    Set-Item -Path function:\MyPrompt -Value $MyPrompt
    Set-Item -Path function:\PostPrompt  -Value $PostPrompt
    Set-Item -Path function:\prompt  -Value $Prompt
}

function Activate-FancyShell {
    param (
        [string]$name
    )
    $path = "$env:POSH_THEMES_PATH/$name.omp.json"
    if (!(test-path $path)) { 
        $path = "$PSScriptRoot\config.omp.json"
    }
    oh-my-posh init pwsh --config $path | invoke-expression
    echo $path
}
set-alias afs activate-fancyshell
