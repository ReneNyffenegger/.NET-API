
using System;
using System.Linq;

class Prg {

   static void Main() {

      string[] words  = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" };
      System.Linq.IOrderedEnumerable<string> sorted =  words.OrderBy(wrd => wrd);

   //
   // The preevious OrderBy() returned, in fact, a
   //    System.Linq.OrderedEnumerable<System.String, System.String>:
      Console.WriteLine(sorted.GetType().FullName);

      foreach (string word in sorted) {
         Console.WriteLine(word);
      }
   }
}
