set-strictMode -version 2.0

$boolFlag = @{ $true = 'x'; $false = ' ' }

foreach ($info in [System.Text.Encoding]::GetEncodings()) {

   $enc = $info.GetEncoding()

   '{0,5} {1,-30} {2} {3}' -f
      $info.CodePage,
      $info.Name,
    # $enc.BodyName,                    # BodyName seems to be always equal to Name
    # $enc.HeaderName,                  # HeaderName seems to be always equal to Name
      $boolFlag[$enc.IsBrowserDisplay],
      $boolFlag[$enc.IsSingleByte    ]
    # $enc.WebName                      # WebName seems to be always equal to Name

}
