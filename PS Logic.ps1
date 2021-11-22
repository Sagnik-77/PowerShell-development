
$path = 'C:\Windows' #windows
# $path = /home #linux
$evalPath = Test-Path $path
if ($evalPath -eq $true) {
    Write-Host "$path VERIFIED"
}
elseif ($evalPath -eq $false) {
    Write-Host "$path NOT VERIFIED"
}

#----------------------------------
[int]$aValue = Read-Host 'Enter a number'
switch ($aValue) {
    1 {  
        Write-Host 'You entered the number ONE'
    }
    2 {  
        Write-Host 'You entered the number TWO'
    }
    3 {  
        Write-Host 'You entered the number THREE'
    }
    4 {  
        Write-Host 'You entered the number FOUR'
    }
    5 {  
        Write-Host 'You entered the number FIVE'
    }
    Default {
        Write-Host "Sorry, I don't know what to do with $aValue"
    }
}

#-------------------------------------------
# rainbow example
for ($i = 5; $i -le 16; $i++) {
    Write-Host $i -ForegroundColor $i
}

#-------------------------------------------
$aString = 'Jean-Luc Picard'
$reverseString = ''
for ($i = $aString.Length; $i -ge 0; $i--) {
    $reverseString += $aString[$i]
}
for ($i = 0; $i -le $aString.Length; $i++) {
    $reverseString += $aString[$i]
}
$aString
$reverseString
#------------------------------
#D:\FIFTH SEMESTER\Computer Architecture
$path = 'D:\FIFTH SEMESTER\Computer Architecture'
[int]$totalSize = 0
$fileInfo = Get-ChildItem $path -Recurse
foreach ($file in $fileInfo) {
    $totalSize += $file.Length
}
$totalSize
Write-Host "The total size of file in $path is $($totalSize /1MB ) MB."
#------------------------------
#-------------------------------------------------
# do while loop
$pathVerified = $false
do {
    # in a do while, the user will always be prompted at least once
    $path = Read-Host 'Please enter a file path to evaluate'
    if (Test-Path $path) {
        $pathVerified = $true
    }
} while ($pathVerified -eq $false)
# the loop will continue until the path is verified
#-------------------------------------------------
# while loop
$pathVerified = $false
while ($pathVerified -eq $false) {
    # in a while loop, you might never enter the loop
    $path = Read-Host 'Please enter a file path to evaluate'
    if (Test-Path $path) {
        $pathVerified = $true
    }
}
# this loop was never entered because $pathVerified is $true
#-------------------------------------------------
#Where-Object
# Get processes using more than 50MB of memory
$largeProcesses = Get-Process | Where-Object { $_.WorkingSet64 -gt 50MB }
 
# do the same thing using if statements and loop
$largeProcesses = @()
$processes = Get-Process
foreach ($process in $processes) {
    if ($process.WorkingSet64 -gt 50MB) {
        $largeProcesses += $process
    }
}
#------------------------------
#For-Each-Object
$path = 'D:\FIFTH SEMESTER'
$folderCount = 0
Get-ChildItem $path | ForEach-Object -Process { if ($_.PSIsContainer) { $folderCount++ } }
$folderCount