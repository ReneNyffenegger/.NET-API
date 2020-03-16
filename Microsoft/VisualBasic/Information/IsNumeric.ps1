add-type -assembly Microsoft.VisualBasic

[Microsoft.VisualBasic.Information]::IsNumeric(  42       )  # True
[Microsoft.VisualBasic.Information]::IsNumeric(  42.1     )  # True
[Microsoft.VisualBasic.Information]::IsNumeric(" 42.1"    )  # True
[Microsoft.VisualBasic.Information]::IsNumeric(" 42.1"    )  # True
[Microsoft.VisualBasic.Information]::IsNumeric(" 42.1 xyz")  # False
[Microsoft.VisualBasic.Information]::IsNumeric( $true     )  # True
[Microsoft.VisualBasic.Information]::IsNumeric( $false    )  # True
