$psi = new-object System.Diagnostics.ProcessStartInfo

$psi.UseShellExecute  = $true
$psi.WorkingDirectory = $env:userprofile

$psi.FileName         = 'cmd.exe'
$psi.Arguments        = '/k echo Working directory is %cd%'

$proc = [System.Diagnostics.Process]::Start($psi)

write-host "process id is $($proc.id)"
