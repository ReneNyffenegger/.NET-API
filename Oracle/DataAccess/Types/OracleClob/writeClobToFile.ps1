add-type -path "$env:oracle_home\odp.net\bin\4\Oracle.DataAccess.dll"

$enc = [System.Text.Encoding]::GetEncoding(1252)

$conn = [Oracle.DataAccess.Client.OracleConnection]::new("User ID=rene;Password=rene;data source=ora19")
$conn.Open()

$sql  = [Oracle.DataAccess.Client.OracleCommand]::new("select filename, text from tab", $conn)
$sql.CommandType = [System.Data.CommandType]::Text

$rdr = $sql.ExecuteReader()

while ($rdr.Read()) {

    $filename = $rdr.GetString(0);
    $text     = $rdr.GetOracleClob(1)

    $dirname  = split-path $filename

    if (-not (test-path $dirname)) {
       $null = mkdir $dirname
    }

    $filename

    $out_file = new-object System.IO.StreamWriter "$pwd/$filename", $false, $enc
    $out_file.Write($text.Value)
    $out_file.Close()
}
