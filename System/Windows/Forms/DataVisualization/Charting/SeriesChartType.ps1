[enum]::GetValues([System.Windows.Forms.DataVisualization.Charting.SeriesChartType]) | sort-object {
   $_.ToString()
} | foreach-object {
  '{0,-17} {1,2}' -f $_.ToString(), $_.value__
}
