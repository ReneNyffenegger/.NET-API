rm   App.exe        -errorAction ignore
rm   App.exe.config -errorAction ignore

csc  -nologo App.cs

& .\App

mv tq84.config App.exe.config

& .\App

mv App.exe.config tq84.config

& .\App
