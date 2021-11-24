add-type -assemblyName System.Windows.Forms
add-type -assemblyName System.Windows.Forms.DataVisualization

$width  = 600
$height = 380
$gap    =  20

$sin = new-object System.Windows.Forms.DataVisualization.Charting.Series
$cos = new-object System.Windows.Forms.DataVisualization.Charting.Series

for ($p = 0; $p -le 50; $p++) {
   $x = -[Math]::PI + $p * 2*[Math]::PI / 50

   $null = $sin.Points.AddXY($x, [Math]::Sin($x))
   $null = $cos.Points.AddXY($x, [Math]::Cos($x))
}

$sin.ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Line
$cos.ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Point

$chart         =  new-object System.Windows.Forms.DataVisualization.Charting.Chart

$chart.Series.Add($sin)
$chart.Series.Add($cos)

$chart.Width           = $width   - 2*$gap
$chart.Height          = $height  - 2*$gap
$chart.Left            =              $gap
$chart.Top             =              $gap
$chart.BackColor       = [System.Drawing.Color]::White
$chart.BorderColor     = 'Black'

$chartArea        =  new-Object System.Windows.Forms.DataVisualization.Charting.ChartArea
$chart.ChartAreas.Add($chartArea)

$ext = 'png'
$chart.SaveImage("$env:temp\chart.$ext", $ext)

$form        = new-object Windows.Forms.Form

#
#     TODO: Where are these numbers (15 and 35)
#           coming from?
#
$form.Width  = $width  + 15
$form.Height = $height + 35

$form.controls.add($chart)

#
#  Resize controls with form:
#
$AnchorAll = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right -bor [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left
$chart.Anchor = $AnchorAll

$Form.Add_Shown({$Form.Activate()})
$null = $Form.ShowDialog()
