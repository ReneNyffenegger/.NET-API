$enumValues = [System.Enum]::GetValues('System.Management.Automation.JobState')

$enumValues | foreach-object  {
  '{0,2} {1,-30}' -f $_.value__, $_.ToString()
}
#
#  0 NotStarted
#  1 Running
#  2 Completed
#  3 Failed
#  4 Stopped
#  5 Blocked
#  6 Suspended
#  7 Disconnected
#  8 Suspending
#  9 Stopping
# 10 AtBreakpoint
