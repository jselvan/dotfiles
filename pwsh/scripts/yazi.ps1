$env:YAZI_FILE_ONE="C:\Program Files\Git\usr\bin\file.exe"
$env:YAZI_CONFIG_HOME="$env:CONFIG/yazi"
$env:YAZI_NIFTI="$env:YAZI_CONFIG_HOME/scripts/nifti_to_png.py"
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
