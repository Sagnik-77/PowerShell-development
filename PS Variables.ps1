get-service
$progress = get-service

#----------------------------------------
# not using variable
Get-Process | Where-Object {$_.CPU -gt 5000} #find processes keeping the CPU busy
Get-Process | Sort-Object WorkingSet64 -Descending #sort processes by memory usage
#----------------------------------------
# using variable
$processes = Get-Process
$processes | Where-Object {$_.CPU -gt 5000} #find processes keeping the CPU busy
$processes | Sort-Object WorkingSet64 -Descending #sort processes by memory usage
#----------------------------------------

#----------------------------------------
$total = 2 + 2
$total
$total | Get-Member
#----------------------------------------
$total = '2 + 2'
$total
$total | Get-Member
#----------------------------------------

#----------------------------------------
$num1 = 2
$num2 = 2
$total = $num1 + $num2
$total
#----------------------------------------
$num1 = '2'
$num2 = '2'
$total = $num1 + $num2
$total
#----------------------------------------
[int]$num1 = '2'
[int]$num2 = '2'
$total = $num1 + $num2
$total

$stringReturn = $total.ToString()

#----------------------------------------
$sum = 1+2

$literals = 'Two plus one equals : $sum'
$literals

$escaped = "Two plus one equals : $sum"
$escaped

#------------------------------
$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large files...'
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 500KB}
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "You have $largeFilesCount large file(s) in $path"