$sid  = new-object System.Security.Principal.SecurityIdentifier 'S-1-5-18'

$name = $sid.Translate([type]'System.Security.Principal.NTAccount')
$name.GetType().FullName
#
# System.Security.Principal.NTAccount

#
#  Show name
#
write-output $name.Value
#
#  NT AUTHORITY\SYSTEM
