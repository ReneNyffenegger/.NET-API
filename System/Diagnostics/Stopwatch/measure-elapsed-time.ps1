$stopWatch = new-object System.Diagnostics.Stopwatch

$stopWatch.Start()

$null = [System.Windows.Forms.Messagebox]::Show(
    "Press OK when done"    ,
    "Measuring elapsed time",
    [System.Windows.Forms.MessageBoxButtons]::OK
)


write-output("$($stopWatch.ElapsedMilliseconds) milliseconds have elapsed")
