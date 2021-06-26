$thisScript = $myInvocation.myCommand.path

#
# get-item returns a System.IO.FileInfo
#
$fileInfo = get-item $thisScript

#
#  CreationTimeUtc evaluates to a System.DateTime
#
$creationTimeUTC = $fileInfo.CreationTimeUtc

$creationTimeUTC.ToFileTimeUtc()
