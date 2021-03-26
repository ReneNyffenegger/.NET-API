//
//    csc -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\WindowsPowerShell\3.0\system.management.automation.dll" -target:library Add-Strings.cs
//
//    import-module .\Add-Strings.dll
//
//    Add-Strings foo bar
//
using System.Management.Automation;

[Cmdlet("Add", "Strings")]
[OutputType("System.String")]
public class AddStrings : Cmdlet {

 //
 // Specify the two parameters for the cmdlet:
 //
   [Parameter(Position=0, Mandatory=true)]
    public string Text1 {
       get { return t1;  }
       set { t1 = value; }
    }

   [Parameter(Position=1, Mandatory=true)]
    public string Text2 {
       get { return t2;  }
       set { t2 = value; }
    }

    private string t1;
    private string t2;

 //
 // Define functionality of cmdlet by
 // overriding ProcessRecord.
 // This method will be called when the
 // cmdlet is executed.
 //
    protected override void ProcessRecord() {
 //
 //    WriteObject(…) puts an object into
 //    the output pipe:
 //
       WriteObject(Text1 + " " + Text2);
    }
}
