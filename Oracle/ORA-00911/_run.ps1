if (test-path throws-00911.exe) {
   remove-item throws-00911.exe
}

csc -r:C:\Oracle\19\ODP.NET\managed\common\Oracle.ManagedDataAccess.dll throws-00911.cs

echo '
@create-table.sql
exit
' | sqlplus -silent rene/rene

& .\throws-00911.exe


echo '
select * from ora_00911_test;

drop table ora_00911_test;
exit
' | sqlplus -silent rene/rene
