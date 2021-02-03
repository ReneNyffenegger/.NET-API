set-strictMode -version latest

add-type -assemblyName presentationCore

$mediaPlayer = new-object system.windows.media.mediaplayer

function play-soundFile {
   param( $file )

   $length_ms = 0
   $mediaPlayer.Open($file)
   do {

      try {
           $length_ms = $mediaPlayer.NaturalDuration.TimeSpan.TotalMilliseconds
      }
      catch [System.Management.Automation.PropertyNotFoundException] {
         start-sleep -milliSecond 10
      }
   }
   until ($length_ms)

  "Playing $file, duration $length_ms ms"
   $mediaPlayer.Play()
   start-sleep -milliSecond $length_ms

   $mediaPlayer.Stop()
   $mediaPlayer.Close()

}

play-soundFile 'C:\WINDOWS\media\Windows Foreground.wav'
play-soundFile 'C:\WINDOWS\media\Windows Background.wav'
play-soundFile 'C:\WINDOWS\media\Windows Logon.wav'
