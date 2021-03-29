$stmt = $con.CreateCommand()
$stmt.CommandText = 'commit'

if ($stmt.ExecuteNonQuery() -ne -1) {
   write-host "expected: -1"
}
