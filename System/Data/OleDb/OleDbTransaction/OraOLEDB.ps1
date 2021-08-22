$connString = "Provider=OraOLEDB.Oracle;User Id=rene;Data Source=Ora19;Password=rene"

$conn = new-object System.Data.OleDb.OleDbConnection $connString
$conn.Open()

$createTable = new-object System.Data.OleDb.OleDbCommand
$createTable.CommandText = 'create table tq84_commit_test(a number)'
$createTable.Connection  = $conn
$null = $createTable.ExecuteNonQuery()

[System.Data.OleDb.OleDbTransaction] $trx = $conn.BeginTransaction()
$insert = new-object System.Data.OleDb.OleDbCommand
$insert.CommandText = 'insert into tq84_commit_test values (1)'
$insert.Connection  = $conn
$insert.Transaction = $trx
$null = $insert.ExecuteNonQuery()
read-host -prompt 'record inserted, press enter to commit'
$trx.Commit()

read-host -prompt 'commited, press enter to drop table'
$dropTable = new-object System.Data.OleDb.OleDbCommand
$dropTable.CommandText = 'drop table tq84_commit_test'
$dropTable.Connection  = $conn
$null = $dropTable.ExecuteNonQuery()
