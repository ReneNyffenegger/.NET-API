$res = [System.Windows.Forms.Messagebox]::Show(
    "Do you feel like it?",
    "Choose wisely"       ,
    [System.Windows.Forms.MessageBoxButtons]::YesNo
)

if ($res -eq [System.Windows.Forms.DialogResult]::Yes) {
  write-output "Go for it!"
}
else {
  write-output "You should reconsider your decision."
}
