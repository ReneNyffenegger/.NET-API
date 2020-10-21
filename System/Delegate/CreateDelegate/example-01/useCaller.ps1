
class test {

   static [float] add([float] $a, [float] $b) { return $a + $b}
   static [float] sub([float] $a, [float] $b) { return $a - $b}
   static [float] mul([float] $a, [float] $b) { return $a * $b}

   static [TQ84.caller+funcPtrType] createDelegate($methodName) {
     $delegate = [System.Delegate]::CreateDelegate([TQ84.caller+funcPtrType], [test], $methodName, $true, $true)
     return $delegate
   }
}

$callAdd = [TQ84.caller]::new(); $callAdd.funcPtr = [test]::createDelegate('add')
$callSub = [TQ84.caller]::new(); $callSub.funcPtr = [test]::createDelegate('sub')
$callMul = [TQ84.caller]::new(); $callMul.funcPtr = [test]::createDelegate('mul')

$callAdd.callFuncPtr(19, 23)
$callSub.callFuncPtr(55, 13)
$callMul.callFuncPtr( 6,  7)
