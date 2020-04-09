//
// csc  -r:c:\oracle\18c\ODP.NET\managed\common\Oracle.ManagedDataAccess.dll select-to-file.cs
//

using System;
using System.Data;
using System.IO;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

class Prg {

   static void Main() {

      OracleConnection ora = new OracleConnection("user id=rene;password=rene;data source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ORA18)))");
      ora.Open();

      OracleCommand    stmt = new OracleCommand("select bin from table_with_long_raw where id = :id", ora);
      stmt.CommandType      = CommandType.Text;

      stmt.Parameters.Add("id", OracleDbType.Int32).Value = 42;

   //
   // Following line is kind of crucial: it specifies that
   // the entire length of the long raw needs to be read:
   //
      stmt.InitialLONGFetchSize  = -1;

      OracleDataReader rdr = stmt.ExecuteReader();

      rdr.Read();
      OracleBinary bin = rdr.GetOracleBinary(0);
      File.WriteAllBytes("extracted.bin", bin.Value);
   }
}
