if (!(test-path env:config)) {
    echo "Set the config path in env:config"
} 
elseif ($env:config -ne [Environment]::GetEnvironmentVariable('CONFIG', 'User'))
{
    echo "Config variable is different from what is in the system"
    [Environment]::SetEnvironmentVariable('CONFIG', $env:config, 'User')
}

$profile_new = [System.IO.Path]::GetFullPath("$env:CONFIG\pwsh\profile.ps1")
$profile_old = [System.IO.Path]::GetFullPath($profile)
$line =  '. "$env:CONFIG\pwsh\profile.ps1"'

if ($profile_old -eq $profile_new) 
{
    echo "Already set up!"
}
elseif (sls "$line" $profile_old -SimpleMatch) 
{
    echo "Custom profile init is already in system profile"
    echo "You might just need to restart shell"
    echo "Else, verify that this command isnt being masked somehow"
}
else 
{
    "$line" >> $profile_old
    echo "appended custom profile init to system profile"
    echo "reboot shell to take effect"
}
