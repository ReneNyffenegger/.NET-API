set-strictMode -version latest

$enc_utf8_without_bom = new-object System.Text.UTF8Encoding $false

#
#  Create new StreamWriter. Setting second paramter to
#  $true opens the stream in 'append' mode:
#
$str = new-object System.Io.StreamWriter "$pwd/file.txt", $true, $enc_utf8_without_bom

$str.WriteLine("This line was written at $( get-date -format 'yyyy-MM-dd HH-mm-ss (K)')" )


#
#  For demonstration purposes: close and re-open stream:
#
$str.Close()
$str = new-object System.Io.StreamWriter "$pwd/file.txt", $true, $enc_utf8_without_bom

$str.WriteLine('  foo')
$str.WriteLine('  bar')
$str.WriteLine('  baz')
$str.Close()
