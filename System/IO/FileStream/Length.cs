using System;
using System.IO;

class Prg {
   static void Main() {
      FileStream fs = new FileStream("Length.cs", FileMode.Open, FileAccess.Read);
      Console.WriteLine($"Size of {fs.Name} is {fs.Length} bytes");
   }
}
