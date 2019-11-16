using System;
using System.Linq;
using System.Collections.Generic;

class Prg {

   static void Main() {

      Int32 start = 12;
      Int32 count =  7;

      IEnumerable<Int32> range = Enumerable.Range(start, count);
      foreach (Int32 elem in range) {
         Console.WriteLine(elem);
      }
   }
}
//
// 12
// 13
// 14
// 15
// 16
// 17
// 18
//
