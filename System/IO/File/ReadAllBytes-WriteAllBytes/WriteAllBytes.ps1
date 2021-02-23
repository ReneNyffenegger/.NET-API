[Byte[]] $byte_array = 72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 46

[System.IO.File]::WriteAllBytes("$pwd/hello-world.txt", $byte_array)
