using System;

namespace struct_example {

   struct S {
      public int    num;
      public string txt;
   };


   class Prg {
      static void Main() {

         S s;   // <-- Note: new operator not needed
         s.num = 42;
         s.txt ="Hello World";

         Console.WriteLine(s.GetType().BaseType.FullName);
      // System.ValueType

      }
   }
}
