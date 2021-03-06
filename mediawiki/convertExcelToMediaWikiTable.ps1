###############################################
## Utility to convert excel to mediawiki tables
###############################################

$FilePath = 'c:\temp\projectlist.xlsx'  ##Input excel that will be read

$excelApplication = New-Object -ComObject Excel.Application
$excelApplication.Visible = $true
$excelWorkBook = $excelApplication.Workbooks.Open($filepath)

[int] $sheetNo =  Read-Host 'Enter sheet number'
[int] $startRow = Read-Host 'Enter starting ROW. The ROW which should be read first.'
[int] $endRow = Read-Host 'Enter ending ROW. The ROW which will be read last.'
[int] $numColumns = Read-Host 'Enter number of columns. The number of columns to read.'
[int] $currentColumn= 1

$excelWorkSheet = $excelWorkBook.Sheets.Item($sheetNo)
$dataRead = "| "
while ($startRow -le $endRow) {
   
   while($currentColumn -le $numColumns) {
      $dataRead += $excelWorkSheet.Cells.Item($startRow,$currentColumn).Text + " || "
            
      $currentColumn++  
   }
   Write-Host $dataRead
   Write-Host "|-"
   
   $currentColumn=1
   $dataRead = "| "
   $startRow++
}

# cleanup
$excelWorkBook.close()
$excelApplication.Quit()