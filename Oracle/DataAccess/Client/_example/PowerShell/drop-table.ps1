$stmt = $con.CreateCommand()
$stmt.CommandText = 'drop table tq84_table'

if ($stmt.ExecuteNonQuery() -ne -1) {
   write-host "expected: -1"
}
