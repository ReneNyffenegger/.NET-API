//
//    csc -r:Microsoft.VisualBasic.dll read-csv.cs
//
using System;
using System.IO;
using Microsoft.VisualBasic.FileIO;

class Prg {

   static void Main() {

      using TextFieldParser fieldParser = new TextFieldParser($@"{Directory.GetCurrentDirectory()}\data.csv");

      fieldParser.TextFieldType = FieldType.Delimited;
      fieldParser.Delimiters = new string[] {";"};

      while (! fieldParser.EndOfData) {

         string[] fields = fieldParser.ReadFields();

         Console.WriteLine(String.Format("  {0,3} | {1,-15} | {2,-3}", fields[0], fields[1], fields[2]));

      }
   }
}
