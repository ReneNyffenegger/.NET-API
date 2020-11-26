param(
  [parameter(mandatory=$true)]
   $path
)

if ( [System.IO.Path]::IsPathRooted($path) ) {
   write-host "$path is absolute"
}
else {
   write-host "$path is not absolute"
}
