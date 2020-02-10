$progId = 'Excel.Application';

try {
   $comObj = [System.Runtime.InteropServices.Marshal]::GetActiveObject($progId);
   write-output "$progId was found in the RunningObject Table, activating it";

 #
 #  https://stackoverflow.com/a/36717974/180275
 #
   $comObj.windowState = -4140 # xlMinimized
   $comObj.windowState = -4137 # xlMaximized
}
catch [System.Runtime.InteropServices.COMException] {

   write-output "$progId was not found in the Running Object Table, starting it.";

   $comObj = new-object -comObject $progId
   $comObj.visible = $true
}
