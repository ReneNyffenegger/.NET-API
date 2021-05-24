$rnd_stmt = $con.CreateCommand()

$rnd_stmt.CommandType = [System.Data.CommandType]::StoredProcedure
$rnd_stmt.CommandText = 'dbms_random.value'

#
#  Returned parameter needs to be added first
#    (see https://support.oracle.com/knowledge/Oracle%20Database%20Products/261084_1.html)
#
$par_ret  = $rnd_stmt.parameters.add('ret'   ,  [Oracle.DataAccess.Client.OracleDbType]::Decimal, [System.Data.ParameterDirection]::ReturnValue)
# $par_ret.Size = 22
$par_low  = $rnd_stmt.parameters.add('LOW'   ,  [Oracle.DataAccess.Client.OracleDbType]::Decimal, [System.Data.ParameterDirection]::Input      )
$par_high = $rnd_stmt.parameters.add('HIGH'  ,  [Oracle.DataAccess.Client.OracleDbType]::Decimal, [System.Data.ParameterDirection]::Input      )

$par_low.Value  = 10000
$par_high.Value = 10005

$null = $rnd_stmt.ExecuteNonQuery()
write-host "Random value from dbms_random: $($par_ret.Value.ToDouble())"

#
#  Get another random number
#
$par_low.Value  = 20000
$par_high.Value = 20005
$null = $rnd_stmt.ExecuteNonQuery()
write-host "Random value from dbms_random: $($par_ret.Value.ToDouble())"
