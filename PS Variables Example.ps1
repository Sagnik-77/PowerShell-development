# declare a few variables for counting
[int]$fileCount = 0
[int]$folderCount = 0
[int]$totalSize = 0
 
# declare our path we want to evaluate
$path = 'D:\FIFTH SEMESTER\Computer Architecture'
 
# get the file information
$rawFileInfo = Get-ChildItem $path 
 
# loop through that file information
Get-ChildItem $path | ForEach-Object -Process{
    if($_.PSIsContainer){
        $folderCount++
    }
    else{
        $fileCount++
        $totalSize += $item.Length
    }
}
 
# generate output
Write-Host "Breakdown of $path"
Write-Host "Total Directories: $folderCount"
Write-Host "Total Files: $fileCount"
Write-Host "Total Size of files: $($totalSize / 1MB) MB"