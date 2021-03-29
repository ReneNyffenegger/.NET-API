$stmt = $con.CreateCommand()
$stmt.CommandText = 'create table tq84_table (a number, b varchar2(20))'

if ($stmt.ExecuteNonQuery() -ne -1) {
 #
 # ExecuteNonQuery() returns the number of records processed.
 # For non-DML statements, such as this create table statement,
 # or generally, statments that don't contribute
 # to a rowcount, ExecuteNonQuery() returns -1.
 #
   write-host "unexpected"
}
