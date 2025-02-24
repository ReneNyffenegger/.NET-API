set-strictMode -version latest

  $null = [Reflection.Assembly]::LoadWithPartialName(                      "Microsoft.Office.Interop.Excel"   )
# add-type -path      'C:\Program Files (x86)\Microsoft Office\Office16\DCF\Microsoft.Office.Interop.Excel.dll'
# add-type -path 'C:\Program Files (x86)\Microsoft Office\root\Office16\DCF\Microsoft.Office.Interop.Excel.dll'


$xls = new-object Microsoft.Office.Interop.Excel.ApplicationClass

$xls.Visible = $true

$wb = $xls.Workbooks.Add()
$sh = $wb.Worksheets(1)

$sh.Name = "foo bar baz"

$sh.Cells(1,1) = "Hello world"

$wb.SaveAs("$env:temp\excel-test.xlsx")
$xls.Quit()
