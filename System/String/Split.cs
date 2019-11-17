using System;

class Prg {

   public static void Main() {

      String txt = "Hello, world! The words are: foo, bar, baz.";

      String[] words = txt.Split(
             new char[] { ' ', '.', ',', ':', '!', '?' },
             StringSplitOptions.RemoveEmptyEntries
          );

      foreach (String word in words) {
         Console.WriteLine(word);
      }

   }
}
