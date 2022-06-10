public static class logger {

   public static void write(
                                                                string txt     ,
     [System.Runtime.CompilerServices.CallerMemberName        ] string mbr = "",
     [System.Runtime.CompilerServices.CallerFilePath          ] string fil = "",
     [System.Runtime.CompilerServices.CallerLineNumber        ] int    lin =  0,
//   [System.Runtime.CompilerServices.CallerArgumentExpression] string arg = "") // Implemented in compiler for C# 10 and later
   {

      System.Console.WriteLine("logged: " + txt);
      System.Console.WriteLine("  member = " + mbr);
      System.Console.WriteLine("  file   = " + fil);
      System.Console.WriteLine("  line   = " + lin);

   }
}
