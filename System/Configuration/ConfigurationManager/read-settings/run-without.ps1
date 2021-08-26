write-host -foreGroundColor blue 'execute app without App.exe.config'
mv App.exe.config App.exe.config.github
& .\App
