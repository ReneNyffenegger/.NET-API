add-type -assembly 'System.IO.Compression'
add-type -assembly 'System.IO.Compression.FileSystem'

set-strictMode -version latest

function create-zip {

   param (
      [string]      $dirRoot ,
      [scriptBlock] $callBack,
      [string]      $zipFile
   )

   if (test-path $zipFile) {
      remove-item $zipFile
   }

   [System.IO.Compression.ZipArchive] $zip = [System.IO.Compression.ZipFile]::Open(
        "$pwd/$zipFile",
       ([System.IO.Compression.ZipArchiveMode]::Create)
   )

   pushd $dirRoot

   get-childItem -attribute !directory -recurse |
   where-object $callBack |
   foreach-object {

       $fileToAdd         = $_.fullName
       $fileToAddRelative =  resolve-path $fileToAdd -relative

     # remove the dot slash (./) from the relative path:
       $entryName         = $fileToAddRelative.substring(2)

     # write-host "$fileToAddRelative -> $entryName"

       $null = [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
           $zip,
           $fileToAdd,
           $entryName
       )
   }
   popd

   $zip.Dispose()
}
