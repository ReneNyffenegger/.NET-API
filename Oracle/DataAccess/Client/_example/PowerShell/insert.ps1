$ins_stmt = $con.CreateCommand()
$ins_stmt.CommandText = 'insert into tq84_table(a, b) values (:a, :b)'
$param_a  = $ins_stmt.Parameters.Add(':a' , [Oracle.DataAccess.Client.OracleDbType]::Decimal)
$param_b  = $ins_stmt.Parameters.Add(':b' , [Oracle.DataAccess.Client.OracleDbType]::Varchar2)

$param_a.value = 42
$param_b.value ='Hello world'
if ($ins_stmt.ExecuteNonQuery() -ne 1) {
   write-host "Expected: 1"
}

$param_a.value = 99
$param_b.value ='ninety-nine'
$ins_stmt.ExecuteNonQuery()
if ($ins_stmt.ExecuteNonQuery() -ne 1) {
   write-host "Expected: 1"
}
