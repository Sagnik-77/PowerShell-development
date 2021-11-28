
# non-terminating error
1/0;Write-Host 'Hello, will I run after an error?'
#---------------------------------------------------
$collection = @(
    'C:\Test\newcsv.csv',
    'c:\nope\nope.txt'
    'C:\Test\newcsv2.csv'
)
foreach ($item in $collection) {
    Get-Item $item
}
#---------------------------------------------------
# Without ErrorAction
Get-Item -Path c:\nope\nope.txt;Write-Host 'Hello, will I run after an error?'
# With ErrorAction
Get-Item -Path c:\nope\nope.txt -ErrorAction Stop;Write-Host 'Hello, will I run after an error?'
# throw causes PowerShell to terminate
try {
    1/0;Write-Host 'Hello, will I run after an error?'
}
catch {
    throw
}
# write-error in pipeline
try {
    1/0;Write-Host 'Hello, will I run after an error?'
}
catch {
    write-error $_
    write-host 'this is in the catch'
}
#--------------------------------------------------
# this example will not go the catch and will run the Write-Host
try {
    Get-Item -Path c:\nope\nope.txt;Write-Host 'Hello, will I run after an error?'
}
catch {
    Write-Host 'You are now in the catch'
}
 
# this example will error and go directly to the catch
try {
    Get-Item -Path c:\nope\nope.txt -ErrorAction Stop;Write-Host 'Hello, will I run after an error?'
}
catch {
    Write-Host 'You are now in the catch'
}