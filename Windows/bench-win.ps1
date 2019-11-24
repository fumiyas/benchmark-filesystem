$startTime = (Get-Date)

$rv = .\bin\winfile-cp.ps1 $src $dst

$time = (New-TimeSpan $startTime (Get-Date)).TotalSeconds

