set-strictMode -version latest

$enc_utf8_with_bom    = new-object System.Text.UTF8Encoding $true
$enc_utf8_without_bom = new-object System.Text.UTF8Encoding $false
$enc_1252             =[System.Text.Encoding]::GetEncoding(1252)

$out_utf8_with_bom    = new-object System.IO.StreamWriter "$pwd/utf-8-with-bom.txt"     , $false, $enc_utf8_with_bom
$out_utf8_without_bom = new-object System.IO.StreamWriter "$pwd/utf-8-without-bom.txt"  , $false, $enc_utf8_without_bom
$out_1252             = new-object System.IO.StreamWriter "$pwd/1252.txt"               , $false, $enc_1252

$out_utf8_with_bom.WriteLine('Bärlauch')
$out_utf8_without_bom.WriteLine('Bärlauch')
$out_1252.WriteLine('Bärlauch')

$out_utf8_with_bom.close()
$out_utf8_without_bom.close()
$out_1252.close()

format-hex "$pwd/utf-8-with-bom.txt" 
format-hex "$pwd/utf-8-without-bom.txt" 
format-hex "$pwd/1252.txt" 
