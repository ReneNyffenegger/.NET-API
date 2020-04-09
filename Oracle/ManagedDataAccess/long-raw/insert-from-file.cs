//
// csc  -r:c:\oracle\18c\ODP.NET\managed\common\Oracle.ManagedDataAccess.dll insert-from-file.cs
//

using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.IO;

class Prg {

   private static void Main() {

      OracleConnection ora = new OracleConnection("user id=rene;password=rene;data source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=ORA18)))");
      ora.Open();

   //
   // Read file content into byte array:
   //
      FileStream fs = new FileStream("Snake_River_(5mb).jpg", FileMode.Open, FileAccess.Read);
      Console.WriteLine("File size: {0}", fs.Length);
      byte[] data = new byte[fs.Length];
      fs.Read(data,0,System.Convert.ToInt32(fs.Length));
      fs.Close();

   //
   // Bind parameters:
   //
      OracleCommand stmt = new OracleCommand();
      stmt.CommandText = "insert into table_with_long_raw values(:id, :bin)";
      stmt.Connection  =  ora;
      stmt.CommandType =  CommandType.Text;

      stmt.Parameters.Add("id" , OracleDbType.Int32  ).Value = 42;
      stmt.Parameters.Add("bin", OracleDbType.LongRaw).Value = data;

   // OracleParameter id  = stmt.Parameters.Add("id" , OracleDbType.Int32  );
   // OracleParameter bin = stmt.Parameters.Add("bin", OracleDbType.LongRaw);

   // id.Value  = 42;
   // bin.Value = data;

      stmt.ExecuteNonQuery();
   }
}
