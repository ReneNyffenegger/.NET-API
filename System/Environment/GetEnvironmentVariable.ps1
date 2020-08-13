$env:PATH="$env:PATH;p:\ath\to\foo\bar\baz"

$pathUser     = [Environment]::GetEnvironmentVariable('PATH', 'user'    )
$pathSystem   = [Environment]::GetEnvironmentVariable('PATH', 'machine' )
$pathProcess  = [Environment]::GetEnvironmentVariable('PATH', 'process' )

write-host "Paths of user:"    ; write-host ( $pathUser    -replace ';', "`n" )
write-host "Paths of system:"  ; write-host ( $pathSystem  -replace ';', "`n" )
write-host "Paths of process:" ; write-host ( $pathProcess -replace ';', "`n" )
