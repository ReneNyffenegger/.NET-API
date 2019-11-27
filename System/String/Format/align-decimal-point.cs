using System;

class Prg {

   public static void Main() {
      var nums = new object[] { 42, 12.34567, null, 7.1F,  9876.54321 };

      foreach (var num in nums) {
         Console.WriteLine(String.Format(
           "  {0,-20}: {1,8:F3}",
              num == null ? "null" : num.GetType().FullName,
              num
         ));
      }
   }
}
//
// System.Int32        :   42.000
// System.Double       :   12.346
// null                :
// System.Single       :    7.100
// System.Double       : 9876.543
