//
//    csc -r:C:\Windows\Microsoft.NET\assembly\GAC_MSIL\MySql.Data\v4.0_8.0.18.0__c5687fc88969c44d\MySql.Data.dll example.cs
//
using System;
using MySql.Data.MySqlClient;

class Prg {

   static void Main() {

    //
    // Open connection to MySQL
    //    Add old guids=true in order to prevent
    //        System.FormatException: Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx).
    //
       MySqlConnection mySql = new MySqlConnection("Database=tq84_db;Data Source=TQ84-PC;User Id=rene;Password=rene;old guids=true");
       mySql.Open();

    //
    // Create test table:
    //
       MySqlCommand    stmt = mySql.CreateCommand();
       stmt.CommandText = "drop table if exists adoTest";
       stmt.ExecuteNonQuery();

       stmt.CommandText = "create table adoTest(id int, txt text, dc decimal(5,2), dbl double, dt datetime)";
       stmt.ExecuteNonQuery();

    //
    // Fill some values into test table:
    //
    //    Create parameters:
    //
       stmt.CommandText = "insert into adoTest values (@id, @txt, @dec, @dbl, @dt)";
       stmt.Parameters.Add("@id" , MySqlDbType.Int32   );
       stmt.Parameters.Add("@txt", MySqlDbType.String  );
       stmt.Parameters.Add("@dec", MySqlDbType.Decimal );
       stmt.Parameters.Add("@dbl", MySqlDbType.Double  );
       stmt.Parameters.Add("@dt" , MySqlDbType.DateTime);

    //
    //     Start transaction
    //
       MySqlTransaction trx = mySql.BeginTransaction();

    //
    //    Fill parameter values using indices
    //
       stmt.Parameters[0].Value = 42;
       stmt.Parameters[1].Value ="Hello world";
       stmt.Parameters[2].Value = new System.Decimal(1.213);
       stmt.Parameters[3].Value = 37.42;
       stmt.Parameters[4].Value = new System.DateTime(2001, 2, 3, 4, 5, 6);
       stmt.ExecuteNonQuery(); // Add record

    //
    //    Fill parameter values using parameter names
    //
       stmt.Parameters["@id" ].Value = 999;
       stmt.Parameters["@txt"].Value = DBNull.Value;
       stmt.Parameters["@dec"].Value = new System.Decimal(2.219);
       stmt.Parameters["@dbl"].Value = 99;
       stmt.Parameters["@dt" ].Value = new System.DateTime(2002, 2, 2, 2, 2, 2);
       stmt.ExecuteNonQuery(); // Add record


       stmt.Parameters["@id" ].Value = 0;
       stmt.Parameters["@txt"].Value ="foo, bar, baz";
    // stmt.Parameters["@dec"].Value = new System.Decimal(1999.99);
       stmt.Parameters["@dec"].Value = new System.Decimal( 999.99);
       stmt.Parameters["@dbl"].Value = 0.000001;
       stmt.Parameters["@dt" ].Value = DBNull.Value;
       stmt.ExecuteNonQuery(); // Add record

    //
    //     No exception so far? …so commit transaction:
    //
       trx.Commit();

    //
    // Select from table
    //
       Console.WriteLine("");
       stmt.CommandText = "select id, txt, dc, dbl, dt from adoTest";
       MySqlDataReader reader = stmt.ExecuteReader();
       while (reader.Read()) {
          Console.WriteLine(String.Format("  {0,3} | {1,-20} | {2,6:F2} | {3,9:F6} | {4}", reader[0], reader[1], reader[2], reader[3], reader[4]));
       }

   }
}
