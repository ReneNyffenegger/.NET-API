using System;

class C {

   private static void printFormat(String format) {
      Console.WriteLine("{0,-20}: {1}", format, DateTime.Now.ToString(format));
   }

   static void Main() {
      printFormat("yyyy-MM-dd");   
      printFormat("HH:mm:ss"  );   
      printFormat("r"         ); // RFC 1123
      printFormat("s"         ); // sortable
      printFormat("U"         ); // universal
   }
}
//   possible Output:
//
//   yyyy-MM-dd          : 2019-11-09
//   HH:mm:ss            : 20:28:53
//   r                   : Sat, 09 Nov 2019 20:28:53 GMT
//   s                   : 2019-11-09T20:28:53
//   u                   : 2019-11-09 20:28:53Z
