$con   = new-object Oracle.DataAccess.Client.OracleConnection 'Data Source=ORA19;user id=rene;password=rene'
# $con = new-object Oracle.DataAccess.Client.OracleConnection 'Data Source=ORA19;user id=rene;proxy user id=/'

$con.Open()

$con.state # epxected: Open
