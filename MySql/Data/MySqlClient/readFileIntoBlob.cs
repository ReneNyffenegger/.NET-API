//
//    csc -r:C:\Windows\Microsoft.NET\assembly\GAC_MSIL\MySql.Data\v4.0_8.0.18.0__c5687fc88969c44d\MySql.Data.dll readFileIntoBlob.cs
//

using System;
using System.IO;
using MySql.Data.MySqlClient;

class Prg {

   private static void insertFile(MySqlCommand sql, string fileName) {

      string filePath = $@"img\{fileName}";

      FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Read);
      Byte[]     data = new Byte[file.Length];

      file.Read(data, 0, (int)file.Length);

      sql.Parameters["@filename"].Value = fileName;
      sql.Parameters["@image"   ].Value = data;
      sql.ExecuteNonQuery();

   }

   static void Main() {
      MySqlConnection mySql = new MySqlConnection("Database=tq84_db;Data Source=TQ84-08;User Id=rene;Password=rene;old guids=true");
      mySql.Open();

      MySqlCommand    sql;

      sql = new MySqlCommand("drop table if exists tableWithBlob", mySql);
      sql.ExecuteNonQuery();

      sql = new MySqlCommand("create table tableWithBlob(filename varchar(50), image mediumblob)", mySql);
      sql.ExecuteNonQuery();

      sql = new MySqlCommand("insert into tableWithBlob values (@filename, @image)", mySql);
      sql.Parameters.Add("@filename", MySqlDbType.String    );
      sql.Parameters.Add("@image"   , MySqlDbType.MediumBlob);

      insertFile(sql, "Ball.jpg");
      insertFile(sql, "mysql_PNG32.png");
      insertFile(sql, "T-Shirt.jpg");

      mySql.Close();


//    sql.CommandType     = CommandType.Text;
//    MySqlDataReader rdr = sql.ExecuteReader();

//      while (rdr.Read()) {
//         String     filename = rdr.GetString    (0);
//
//         int   blobLen  = (int) rdr.GetBytes(1, 0, null, 0, 0);
//         Byte[] bytes   = new Byte[blobLen];
//         rdr.GetBytes(1, 0, bytes, 0, blobLen);
//
//         Console.WriteLine($"{filename}: {blobLen} bytes");
//         File.WriteAllBytes(filename, bytes);
//      }
   }
}
