// set ORACLE_HOME=c:\oracle\18c
// csc -debug -reference:%oracle_home%\ODP.NET\bin\4\Oracle.DataAccess.dll attributes.cs

using System;
using Oracle.DataAccess.Client;

class Prg {

   static void Main() {

      OracleConnection ora = new OracleConnection("user Id=rene;password=rene;data source=Ora18");
      ora.Open();

      Console.WriteLine($"DatabaseDomainName:  {ora.DatabaseDomainName }");
      Console.WriteLine($"DatabaseEditionName: {ora.DatabaseEditionName}");
      Console.WriteLine($"Database:            {ora.Database           }");
      Console.WriteLine($"DataSource:          {ora.DataSource         }");
      Console.WriteLine($"HostName:            {ora.HostName           }");
      Console.WriteLine($"InstanceName:        {ora.InstanceName       }");
      Console.WriteLine($"PDBName:             {ora.PDBName            }");
      Console.WriteLine($"ServerVersion:       {ora.ServerVersion      }");
      Console.WriteLine($"ServiceName:         {ora.ServiceName        }");

   }
}
