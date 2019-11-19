using System;
using System.Data.Common;
using System.Data.OleDb;
using System.IO;

class Prg {

   static void Main () {

      string csvFilePath = Directory.GetCurrentDirectory();

      string provider =
         // "Microsoft.Jet.OLEDB.4.0"
            "Microsoft.ACE.OLEDB.12.0";

      string connectionString           =
          $"Provider={provider};"       + 
          $"Data Source={csvFilePath};" +
          $"Extended Properties='text';";

      using OleDbConnection connection = new OleDbConnection(connectionString);
      connection.Open();

      DbCommand command = new OleDbCommand("select id, num, txt from data.csv", connection);
//
//       Of course, the constructor returns an OleDbCommand object. Thus, the
//       following line would probably be more correct. But because this
//       program serves at demonstrating the basic functionality of ExecuteReader() and
//       Read(), I have not done so.
//
//    OleDbCommand command = new OleDbCommand("select id, num, txt from data.csv", connection);


      DbDataReader reader = command.ExecuteReader();
//
//       With an OleDbCommand, the ExecuteReader method returns
//       a DbDataReader object:
//
//    OleDbDataReader reader = command.ExecuteReader();

      while (reader.Read()) {
         Console.WriteLine(
            String.Format(" {0,2} | {1,5:F1} | {2}",
               reader.GetInt32 (0),
               reader.GetDouble(1),
               reader.GetString(2)
         ));
      }
   }
}
