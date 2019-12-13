using System;
using System.Data;
using System.Data.Common;

static class Prg {

   public static void Main() {

      DataTable installedProviders = DbProviderFactories.GetFactoryClasses();

      foreach (DataRow provider in installedProviders.Rows) {
         Console.WriteLine("{0,-30} {1}",
           provider["InvariantName"        ],
           provider["Name"                 ]
        // provider["Description"          ],
        // provider["AssemblyQualifiedName"]
        );
      }
   }
}
