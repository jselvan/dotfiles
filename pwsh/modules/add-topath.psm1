function Add-ToPath() {
    Param($path)
    $env:path="$env:path;$path"
}
