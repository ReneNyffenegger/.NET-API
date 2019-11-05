using System;
using System.Net;

class M {

   public static void Main(String[] argv) {

      if (argv.Length != 1) {
         Console.WriteLine("Provide URL to fetch data from");
         return;
      }

      var client = new WebClient();
      client.Headers.Add("User-Agent", ".NET-WebClient/1.0 TQ84");

      var content = client.DownloadString(argv[0]);
      Console.WriteLine(content); 
   }
}
