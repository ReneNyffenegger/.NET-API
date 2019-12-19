using System;
using System.Collections;

static class Prg {

   public static void Main() {

      IDictionary envVars = Environment.GetEnvironmentVariables();

      foreach (DictionaryEntry envVar in envVars) {
         Console.WriteLine("{0,-40}: {1}", envVar.Key, envVar.Value);
      }
   }
}
