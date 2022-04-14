using System;
using Oracle.ManagedDataAccess.Client;

static class ORA_00911 {

   static void execStatement(OracleConnection conn, string stmt) {
   try {

        OracleCommand cmd = (Oracle.ManagedDataAccess.Client.OracleCommand) conn.CreateCommand();
        cmd.CommandText   = stmt;
        cmd.ExecuteNonQuery();
   }
   catch (Exception ex) {
        Console.WriteLine($"Statement {stmt} threw {ex.Message}");
   }
   }


   static int Main(string[] args) {

        OracleConnection conn = new Oracle.ManagedDataAccess.Client.OracleConnection("Data Source=ora19;User Id=rene;Password=rene");
        conn.Open();
        System.Data.Common.DbTransaction trx = conn.BeginTransaction();

        execStatement(conn, "insert into ora_00911_test(col_1, col_2) values (1, 1)");
        execStatement(conn, "insert into ora_00911_test(col_1, col_2) values (2,\u00a02)"); // <<< Note the 'No-Break Space (NBSP)' character (=0x0a).

        trx.Commit();
        conn.Dispose();

        return 0;
   }
}
