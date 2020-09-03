$dt = new-object dateTime 2020,08,28 , 22,23,24

write-host "created date time refers to $('{0:yyyy-MM-dd HH:mm:ss}' -f $dt)"
