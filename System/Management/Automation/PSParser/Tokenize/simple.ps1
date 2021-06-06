$simpleScript = @'
  $x = 7
  $y = 6
  write-host $x*$y
'@

[System.Management.Automation.PSParseError[]] $errors = @()

$tokens = [System.Management.Automation.PSParser]::Tokenize($simpleScript, [ref] $errors)

if ($errors.count) {
   write-host 'statements contained errors'
   return
}

$tokens | format-table
#
#  Content               Type Start Length StartLine StartColumn EndLine EndColumn
#  -------               ---- ----- ------ --------- ----------- ------- ---------
#  x                 Variable     2      2         1           3       1         5
#  =                 Operator     5      1         1           6       1         7
#  7                   Number     7      1         1           8       1         9
#  ...                NewLine     8      1         1           9       2         1
#  y                 Variable    11      2         2           3       2         5
#  =                 Operator    14      1         2           6       2         7
#  6                   Number    16      1         2           8       2         9
#  ...                NewLine    17      1         2           9       3         1
#  write-host         Command    20     10         3           3       3        13
#  $x*$y      CommandArgument    31      5         3          14       3        19
