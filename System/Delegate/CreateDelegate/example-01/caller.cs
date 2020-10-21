using System;

namespace TQ84 {

  public class caller {

     public delegate float funcPtrType(float a, float b);
     public funcPtrType funcPtr;

     public void callFuncPtr(float a, float b) {
        float val = funcPtr(a,b);
        Console.WriteLine($"I have called the function pointer with {a:f} and {b:f} and it returned {val:f}");
     }
  }
}
