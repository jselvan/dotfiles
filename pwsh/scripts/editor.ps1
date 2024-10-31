if (test-commandexists nvim) {
    $env:EDITOR="nvim"
    $env:XDG_CONFIG_HOME=$env:CONFIG
    $env:TERM="pwsh.exe"
} elseif (test-commandexists code) {
    $env:EDITOR="code"
} else {
    $env:EDITOR="notepad"
}
