using System;
using Excel = Microsoft.Office.Interop.Excel;

class E {

   private static Excel.Range getRange(Excel.Worksheet sh, int row1, int col1, int row2, int col2) {
      Excel.Range rng1 = sh.Cells[row1, col1];
      Excel.Range rng2 = sh.Cells[row2, col2];
      return sh.Range[rng1, rng2];
   }

   public static void Main(string[] args) {

      try {

          Excel.Application excel;
          Excel.Workbook    workbook;
          Excel.Worksheet   sheet;

          excel = new Excel.Application();
          excel.Visible = true;

          workbook = excel.Workbooks.Add(System.Reflection.Missing.Value);
          sheet    = workbook.ActiveSheet;

          sheet.Cells[1, 1] = "Number" ;
          sheet.Cells[1, 2] = "English";
          sheet.Cells[1, 3] = "German" ;

          sheet.Cells[1, 4] = "Formula";

          Excel.Range header = getRange(sheet, 1,1 , 1,4);
          header.Font.Bold         = true;
//        header.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
          header.Interior.Color    = System.Drawing.Color.FromArgb(200, 200, 200);

          object[,] values = new object[,] {
             { 1 , "one"   , "eins" },
             { 2 , "two"   , "zwei" },
             { 3 , "three" , "drei" },
             { 4 , "four"  , "vier" },
             { 5 , "five"  , "fünf" }
          };

          int valuesHeight = values.GetLength(0);
          int valuesWidth  = values.GetLength(1);

          getRange(sheet,
            2,                   1                 ,
            2 + valuesHeight -1, 1 + valuesWidth -1
          ).Value2 = values;

          Excel.Range formula = getRange(sheet, 2               , 1+valuesWidth,
                                                2+valuesHeight-1, 1+valuesWidth);

          formula.FormulaR1C1 = "=rc[-3] & \": \" & rc[-2] & \"-\" & rc[-1]";

          Excel.Range columns = getRange(sheet, 1,1 , 1,5);
          columns.EntireColumn.AutoFit();

          excel.UserControl = true;
      }
      catch (Exception e) {
          Console.WriteLine($"Error: {e.Message} Line: {e.Source}");
      }
   }
}
