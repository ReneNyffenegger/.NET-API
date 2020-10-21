[System.Reflection.Assembly]::LoadFile("$pwd/caller.dll");
$null = add-type -path ./caller.dll
