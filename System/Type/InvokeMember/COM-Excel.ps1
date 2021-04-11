set-strictMode -version latest

$xls = new-object -com excel.application

$xls.Gettype().InvokeMember(
   'Visible',                                      # Name
   [System.Reflection.BindingFlags]::SetProperty,  # Invoke attributes
   $null,                                          # Binder
   $xls,                                           # Target
   @($true),                                       # Arguments
   $null                                           # Culture
)

$wbs = $xls.GetType().InvokeMember(
   'Workbooks',
   [System.Reflection.BindingFlags]::GetProperty,
   $null,
   $xls,
   @(),
   $null
)

$wb = $wbs.GetType().InvokeMember(
   'Add',
   [System.Reflection.BindingFlags]::InvokeMethod, # also seemd to work with GetProperty!
   $null,
   $wbs,
   @(),
   $null
)


#
#    Use named parameters for SaveAs
#

$wb = $wb.GetType().InvokeMember(
   'SaveAs',
   [System.Reflection.BindingFlags]::InvokeMethod,
   $null,
   $wb,
   @(                                              # Values of parameters
      "$env:temp\test.xlsm",
      52  # xlOpenXMLWorkbookMacroEnabled
   ),
   $null,                                          # Modifiers
   $null,                                          # Culture
   [string[]] @(                                   # Names of parameters
      'FileName',
      'FileFormat'
   )
)

$xls.Gettype().InvokeMember(
   'Quit',
   [System.Reflection.BindingFlags]::InvokeMethod,
   $null,
   $xls,
   @(),
   $null
)
