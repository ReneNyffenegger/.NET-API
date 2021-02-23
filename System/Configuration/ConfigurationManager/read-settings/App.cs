//
//  csc App.cs
using System;
using System.Configuration;

namespace TQ84  {

  class App  {

    static void Main(string[] args)  {
    //
    // Read App.exe.config
    //
       System.Collections.Specialized.NameValueCollection settings = ConfigurationManager.AppSettings;

    //
    // Get specific values:
    //
       Console.WriteLine("num = " + settings["num"] ?? "n/a");
       Console.WriteLine("txt = " + settings["txt"] ?? "n/a");
       Console.WriteLine("bla = " + settings["bla"] ?? "n/a");

    //
    // Iterate over all values
    //
       Console.WriteLine("--------------");
       Console.WriteLine("There are {0} setting(s) in App.exe.config:", settings.Count);
       foreach (var key in settings.AllKeys)  {
            Console.WriteLine("  {0} = {1}", key, settings[key]);
       }
    }
  }
}
