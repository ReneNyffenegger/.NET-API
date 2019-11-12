using System;
using System.Web.Script.Serialization;

class C {

   #pragma warning disable CS0649 //  Field '…' is never assigned to, and will always have its default value …
   internal class JSONData {
      public Int32  num  ;
      public String txt  ;
      public String[] ary;
   }
   #pragma warning restore CS0649

   static void Main() {

       String JSONText = @"
       {
            ""num"" :   42,
            ""txt"" : ""Hello, World"",
            ""ary"" :[
                       ""zero"",
                       ""one"" ,
                       ""two""
            ]
       }";

       JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();

    //
    // Using DeserializeObject
    //
       dynamic result = jsonSerializer.DeserializeObject( JSONText );
    // Console.WriteLine(result.GetType().FullName);

       Console.WriteLine(result["num"]);
       Console.WriteLine(result["txt"]);
       Console.WriteLine(result["ary"][2]);

       Console.WriteLine("");
    //
    // Using Serialize
    //
       JSONData data = (JSONData) jsonSerializer.Deserialize( JSONText, typeof(JSONData) );

       Console.WriteLine(data.num);
       Console.WriteLine(data.txt);
       Console.WriteLine(data.ary[2]);
   }
}
