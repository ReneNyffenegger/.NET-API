//   set ORACLE_HOME=c:\oracle\18c
//   copy %oracle_home%\ODP.NET\bin\4\Oracle.DataAccess.dll .
//   csc -reference:Oracle.DataAccess.dll GetBytes.cs

using System;
using System.Data;
using System.IO;
using Oracle.DataAccess.Client;

class Prg {

   static void Main() {

      OracleConnection ora =  new OracleConnection($"user Id=rene;password=rene;data source=Ora18");
      ora.Open();
      OracleCommand    sql = new OracleCommand("select filename, image from tq84_sql_loader_long_raw", ora);
//    OracleCommand    sql = new OracleCommand("select filename, image from tq84_sql_loader_blob", ora);
      sql.CommandType      = CommandType.Text;

   //
   // InitialLONGFetchSize needed if data is select from a LONG RAW (but apparently not
   // if selected from a BLOB…)
   //
      sql.InitialLONGFetchSize  = -1;

      OracleDataReader rdr = sql.ExecuteReader();

      while (rdr.Read()) {
         String   filename = rdr.GetString(0);

      //
      // Call GetBytes() with a null Byte[] parameter in order to
      // get required length of data:
      //
         long     len      = rdr.GetBytes (1, 0, null, 0, 0);

         Console.WriteLine($"{filename}: {len} bytes");

      //
      // Get data as Byte[]:
      //
         Byte[] bytes =  new Byte[len];
         rdr.GetBytes(1, 0, bytes, 0, (int) len);

         File.WriteAllBytes(filename, bytes);
      }
   }
}
