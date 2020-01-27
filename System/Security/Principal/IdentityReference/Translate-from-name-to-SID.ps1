#
#  Create a new NTAccount object from a given name
#
$localAdmin = new-object System.Security.Principal.NTAccount 'BUILTIN\Administrators'

#
#  Convert (translate) the NTAccount into a SecurityIdentifier object:
#
$sid = $localAdmin.Translate([type]'System.Security.Principal.SecurityIdentifier')
$sid.GetType().FullName
#
# System.Security.Principal.SecurityIdentifier

#
#  Show the SID
#
write-output $sid.Value
#
#  S-1-5-32-544
