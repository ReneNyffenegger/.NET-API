$sqlite = new-object -typeName System.Data.SQLite.SQLiteConnection
$sqlite.ConnectionString = "Data Source=""$pwd\test.db"""
$sqlite.Open()

$cmd = $sqlite.CreateCommand()
$cmd.CommandText = "INSERT INTO tab (col_1, col_2, col_3) values(@A, @B, @C)";

$null = $cmd.Parameters.AddWithValue("@A",     42);
$null = $cmd.Parameters.AddWithValue("@B", 'Hello');
$null = $cmd.Parameters.AddWithValue("@C", 'World');
$null = $cmd.ExecuteNonQuery()

$null = $cmd.Parameters.AddWithValue("@A",     99);
$null = $cmd.Parameters.AddWithValue("@B", 'ninty');
$null = $cmd.Parameters.AddWithValue("@C", 'nine');
$null = $cmd.ExecuteNonQuery()

$cmd.Dispose()
$SQLite.Close()
