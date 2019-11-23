using System;
using Microsoft.Win32;

class ReadPath {

   private static void printPaths(RegistryKey key) {

      foreach (string path in (key.GetValue("PATH") as string).Split(new char[] {';'})) {
         Console.WriteLine($"  {path}");
      }
   }

   public static void Main() {

      try {
         Console.WriteLine("Global Env");
         RegistryKey globalEnv = Registry.LocalMachine.CreateSubKey(@"SYSTEM\CurrentControlSet\Control\Session Manager\Environment");
         printPaths(globalEnv);
      }
      catch (UnauthorizedAccessException) {
         Console.WriteLine("  Not enough permission to access Environment Key of HKLM");
      }

      RegistryKey userEnv   = Registry.CurrentUser.CreateSubKey(@"Environment");
      Console.WriteLine("User Env");
      printPaths(userEnv);

   }
}
