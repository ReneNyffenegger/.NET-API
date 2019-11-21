using System;
using System.Reflection;

//
// Prevent warning CS8632:
//   The annotation for nullable reference types should only
//   be used in code within a '#nullable' annotations context.
// 
#nullable enable

class Prg {

   public static void Main() { // Needs to be public for reflection!

      Int32   num   =    42;
      Int32?  num_  =  null;

      Console.WriteLine(
         String.Format("  num: {0}, num_: {1}<",
                          num     , num_       ));

      Type       prg = typeof(Prg);
      MethodInfo met = prg.GetMethod("Main");
      MethodBody bod = met.GetMethodBody();
      dynamic    vai = bod.LocalVariables;

      Console.WriteLine("  type of num:  {0}", vai[0].LocalType.FullName); // System.Int32
      Console.WriteLine("  type of num_: {0}", vai[1].LocalType.FullName); // System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]
   }
}
