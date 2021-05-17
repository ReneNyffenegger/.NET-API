$psi = new-object System.Diagnostics.ProcessStartInfo

$psi.FileName  = 'explorer.exe'
$psi.Arguments = $env:userprofile

$proc = [System.Diagnostics.Process]::Start($psi)
