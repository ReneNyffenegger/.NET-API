using System;

namespace Example {

   class XYZ {

      public int    num;
      public string txt;

      public XYZ() {
         num = 42;
         txt ="Hello World";
      }

      public XYZ(int num_, string txt_) {
         num = num_;
         txt = txt_;
      }

   }

   class Prg {

      static void Main() {
         Type   typ = Type.GetType("Example.XYZ");

         if (typ == null) {
            Console.WriteLine("Could not create Example.XYZ");
            return;
         }

         Object obj1 = Activator.CreateInstance(typ);
         Object obj2 = Activator.CreateInstance(typ, new object[] {99, "Foo bar baz"});

         Console.WriteLine("  num = {0}, txt = {1}", (obj1 as XYZ).num, (obj1 as XYZ).txt);
         Console.WriteLine("  num = {0}, txt = {1}", (obj2 as XYZ).num, (obj2 as XYZ).txt);
      }

   }
}
