[Byte[]] $byte_array = [System.IO.File]::ReadAllBytes("$pwd/hello-world.txt")

foreach ($byte in $byte_array) {
   write-host ($byte -as [Char])
}
