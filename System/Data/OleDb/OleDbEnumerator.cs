using System;
using System.Data;
using System.Data.OleDb;

class C  {
   static void Main() {

      OleDbEnumerator E = new OleDbEnumerator();

      DataTable table = E.GetElements();

      foreach (DataRow row in table.Rows)  {

         Console.WriteLine("{0,-30} {1,-60} {2} {3,-5} {4}",
            row["SOURCES_NAME"       ],
         // row["SOURCES_PARSENAME"  ], // == CLSID ???
            row["SOURCES_DESCRIPTION"],
            row["SOURCES_TYPE"       ],
            row["SOURCES_ISPARENT"   ],
            row["SOURCES_CLSID"      ]
         );

//       foreach (DataColumn col in table.Columns)  {
//           Console.WriteLine("{0} = {1}", col.ColumnName, row[col]);
//       }
      }
   }
}
