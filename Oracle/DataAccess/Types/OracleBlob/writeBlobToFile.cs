//   set ORACLE_HOME=c:\oracle\18c
//   copy %oracle_home%\ODP.NET\bin\4\Oracle.DataAccess.dll .
//   csc -debug -reference:Oracle.DataAccess.dll writeBlobToFile.cs

using System;
using System.Data;
using System.IO;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

class Prg {

   static void Main() {

      OracleConnection ora =  new OracleConnection($"user Id=rene;password=rene;data source=Ora18");
      ora.Open();
      OracleCommand    sql = new OracleCommand("select filename, image from tableWithBlob", ora);
      sql.CommandType      = CommandType.Text;
      OracleDataReader rdr = sql.ExecuteReader();

      while (rdr.Read()) {
         String     filename = rdr.GetString    (0);
         OracleBlob image    = rdr.GetOracleBlob(1);

         Console.WriteLine($"{filename}: {image.Length} bytes");

	       Byte[] bytes =  new Byte[image.Length];

    		 int lenRead = image.Read(bytes,0, System.Convert.ToInt32(image.Length ));
         if (lenRead != image.Length) {
            Console.WriteLine($"! lenRead = {lenRead}");
         }

         File.WriteAllBytes(filename, bytes);
      }
   }
}
