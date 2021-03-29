$sel_stmt = $con.CreateCommand()
$sel_stmt.CommandText = 'select b from tq84_table where a > :a'

$param_a = $sel_stmt.parameters.add(':a', [Oracle.DataAccess.Client.OracleDbType]::Decimal)
$param_a.Value = 40

$rdr = $sel_stmt.ExecuteReader()
while ($rdr.Read()) {
   write-host "$($rdr.GetOracleString(0).Value)"
}
