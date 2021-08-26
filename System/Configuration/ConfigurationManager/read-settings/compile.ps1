rm   App.exe        -errorAction ignore
rm   App.exe.config -errorAction ignore

csc  -nologo App.cs
