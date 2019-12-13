using System;
using System.Data.Common;
using System.IO;

static class Prg {

   static string csvFilePath = Directory.GetCurrentDirectory();

   static string provider =
         // "Microsoft.Jet.OLEDB.4.0"
            "Microsoft.ACE.OLEDB.12.0";

   static string connectionString       =
          $"Provider={provider};"       +
          $"Data Source={csvFilePath};" +
          $"Extended Properties='text';";

   public static void Main() {

      DbProviderFactory factory    = DbProviderFactories.GetFactory("System.Data.OleDb");
      DbConnection      connection = factory.CreateConnection();

      connection.ConnectionString  = connectionString;
      connection.Open();

      DbCommand         command    = factory.CreateCommand();
      command.Connection           = connection;
      command.CommandText          ="select * from data.csv";

      DbDataReader      reader     = command.ExecuteReader();

      while (reader.Read()) {
         Console.WriteLine($"{reader["id"]} {reader["txt"]}");
      }
   }
}
