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

      DbCommand command = new OleDbCommand("select count(*) from data.csv", connection);
//
//       Of course, the constructor returns an OleDbCommand object. Thus, the
//       following line would probably be more correct. But because this
//       program serves at demonstrating the basic functionality of ExecuteScalar() ,
//       I have not done sol
//
//    OleDbCommand command = new OleDbCommand("select id, num, txt from data.csv", connection);

      Console.WriteLine("The csv file contains {0} records", (Int32) command.ExecuteScalar());

   }
}
