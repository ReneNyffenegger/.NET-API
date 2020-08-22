add-type -path '.\System.Data.SQLite.dll'

$sqlite = new-object -typeName System.Data.SQLite.SQLiteConnection
$sqlite.ConnectionString = "Data Source=""$pwd\test.db"""
$sqlite.Open()

$sql = $sqlite.CreateCommand()
$sql.CommandText = 'create table tab (col_1, col_2, col_3)'
$null = $sql.ExecuteNonQuery()

$sql.Dispose()
$sqlite.Close()
