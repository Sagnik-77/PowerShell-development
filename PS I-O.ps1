#retrieve dynamic content from a website
$webResults = Invoke-WebRequest -Uri 'https://reddit.com/r/powershell.json'
$rawJSON = $webResults.Content
$objData = $rawJSON | ConvertFrom-Json
$posts = $objData.data.children.data
$posts | Select-Object Title,Score | Sort-Object Score -Descending
#-------------------------------------------------------------------
[int]$numPosts = Read-Host -Prompt "Enter the number of posts to read"
#retrieve dynamic content from a website
$webResults = Invoke-WebRequest -Uri 'https://reddit.com/r/powershell.json'
$rawJSON = $webResults.Content
$objData = $rawJSON | ConvertFrom-Json
$posts = $objData.data.children.data
$posts | select-Object url
$posts | Select-Object url | Sort-Object Score -Descending | Select-Object -First $numPosts
#-------------------------------------------------------------------

# Output simple string to console
Write-Host 'Text output to console'
 
# Customize output to the console with colors:
Write-Host "Warning" -ForegroundColor Yellow
Write-Host "ERROR" -ForegroundColor Red
Write-Host "Works Great" -ForegroundColor Green
Write-Host "CRITICAL ERROR" -BackgroundColor Red -ForegroundColor White
write-host "suck your mom" -backgroundColor green -foregroundColor black
#-------------------------------------------------------------------

# Example 1
Get-Process
 
# Example 2
$processes = Get-Process
Write-Output $processes
 
# Example 3
$processes = Get-Process
$processes