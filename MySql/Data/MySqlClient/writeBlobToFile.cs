//
//    csc -r:C:\Windows\Microsoft.NET\assembly\GAC_MSIL\MySql.Data\v4.0_8.0.18.0__c5687fc88969c44d\MySql.Data.dll writeBlobToFile.cs
//

using System;
using System.Data;
using System.IO;
using MySql.Data.MySqlClient;

class Prg {

   static void Main() {
      MySqlConnection mySql = new MySqlConnection("Database=tq84_db;Data Source=TQ84-08;User Id=rene;Password=rene;old guids=true");
      mySql.Open();

      MySqlCommand    sql = new MySqlCommand("select filename, image from tableWithBlob", mySql);
      sql.CommandType     = CommandType.Text;
      MySqlDataReader rdr = sql.ExecuteReader();

      while (rdr.Read()) {
         String     filename = rdr.GetString    (0);

         int   blobLen  = (int) rdr.GetBytes(1, 0, null, 0, 0);
         Byte[] bytes   = new Byte[blobLen];
         rdr.GetBytes(1, 0, bytes, 0, blobLen);

         Console.WriteLine($"{filename}: {blobLen} bytes");
         File.WriteAllBytes(filename, bytes);
      }
   }
}
