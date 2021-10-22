function watch-directory {
   param (
      [string] $dir
   )

   $fsw = new-object System.IO.FileSystemWatcher  $dir

   $fsw.NotifyFilter          = [System.IO.NotifyFilters]::LastWrite
   $fsw.IncludeSubdirectories = $false

   while($true) {

    #
    # Watch directory for one second only to give user a chance
    # to break out of loop with ctrl-c.
    #
      $timeout = 1000

      [System.IO.WaitForChangedResult] $r = $fsw.WaitForChanged([System.IO.WatcherChangeTypes]::Changed, $timeout)

      if (-not $r.TimedOut) {
       #
       #  WaitForChanged returned because something changed in the
       #  watched directory, not because the timeout period
       #  was reached.
       #
         write-host ($r.Name + ": " + $r.ChangeType)
      }
   }
}
