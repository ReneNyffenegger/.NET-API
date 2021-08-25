#
#   https://stackoverflow.com/questions/68919011/how-do-i-safely-install-a-package-with-oracle-dataaccess
#

add-type -path C:/oracle/19/ODP.NET/bin/4/Oracle.DataAccess.dll

$con = [Oracle.DataAccess.Client.OracleConnection]::new('user Id=rene;password=rene;data source=ora19')
$con.Open()

$cmd = [Oracle.DataAccess.Client.OracleCommand]::new()
$cmd.Connection  = $con;


$cmd.CommandText = @'
create or replace package tq84_pkg_with_errors as
    proc should_read_procedure_not_proc;
end tq84_pkg_with_errors;
'@
$cmd.ExecuteNonQuery()


$cmd.CommandText = @'
create or replace package tq84_pkg_without_errors as
    procedure xyz;
end tq84_pkg_without_errors;
'@
$cmd.ExecuteNonQuery()


$cmd.CommandText = @'
create table tq84_invalid_table_statement (
    foo  no_valid_data_type(10)
)
'@
$cmd.ExecuteNonQuery()
