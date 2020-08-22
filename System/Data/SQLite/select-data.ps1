add-type -path '.\System.Data.SQLite.dll'

$sqlite = new-object -typeName System.Data.SQLite.SQLiteConnection
$sqlite.ConnectionString = "Data Source=""$pwd\test.db"""
$sqlite.Open()

$sql = $sqlite.CreateCommand()
$sql.CommandText = 'select * from tab'

$adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
$data = New-Object System.Data.DataSet
$null = $adapter.Fill($data)

foreach ($datarow in $data.Tables.rows) {
   write-host "$($datarow.col_1) $($datarow.col_2) $($datarow.col_3)"
}

$sql.Dispose()
$SQLite.Close()
