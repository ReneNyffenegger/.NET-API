//   set ORACLE_HOME=c:\oracle\18c
//   copy %oracle_home%\ODP.NET\bin\4\Oracle.DataAccess.dll .
//   csc -reference:Oracle.DataAccess.dll writeLongRawToFile.cs

using System;
using System.Data;
using System.IO;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

class Prg {

   static void Main() {

      OracleConnection ora =  new OracleConnection($"user Id=rene;password=rene;data source=Ora18");
      ora.Open();
      OracleCommand    sql = new OracleCommand("select filename, image from tq84_sql_loader_long_raw", ora);
//    OracleCommand    sql = new OracleCommand("select filename, image from tableWithLongRaw", ora);
      sql.CommandType      = CommandType.Text;

   //
   // Following line is kind of crucial: it specifies that
   // the entire length of the long raw needs to be read:
   //
      sql.InitialLONGFetchSize  = -1;

      OracleDataReader rdr = sql.ExecuteReader();

      while (rdr.Read()) {
         String       filename = rdr.GetString    (0);
         OracleBinary image    = rdr.GetOracleBinary(1);

         Console.WriteLine($"{filename}: {image.Length} bytes");

         File.WriteAllBytes(filename, image.Value);
      }
   }
}
