$logo=(get-content -raw "$env:config\pwsh\assets\luffy.txt")
$lines=($logo -split '\r?\n')
$info=@"
$user
$cpu
$gpu
$time
"@
