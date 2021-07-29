set-strictMode -version 3

[System.Management.Automation.Language.Token[]     ] $tokens = $null
[System.Management.Automation.Language.ParseError[]] $errors = $null

$code = @'
$x = 2; $y = 4
$res = $x + $y
write-host "result = $res"
'@

$ast = $null = [System.Management.Automation.Language.Parser]::ParseInput(
        $code,
  [ref] $tokens,
  [ref] $errors
)

foreach ($token in $tokens) {

   $text = $token.Text -replace "`n", '<CR>'

#  write-host ($token.TokenFlags)
   write-host ('  {0,-30} {1}' -f $text, $token.Kind)
}
#
#  $x                             Variable
#  =                              Equals
#  2                              Number
#  ;                              Semi
#  $y                             Variable
#  =                              Equals
#  4                              Number
#  <CR>                           NewLine
#  $res                           Variable
#  =                              Equals
#  $x                             Variable
#  +                              Plus
#  $y                             Variable
#  <CR>                           NewLine
#  write-host                     Generic
#  "result = $res"                StringExpandable
#                                 EndOfInput
