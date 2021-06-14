#
#   Note: this example is also filed under github/PowerShell
#
set-strictMode -version latest

# Add-Type -AssemblyName System.Windows.Forms

[xml]$XAML = @'
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:Switch_UILanguage"

    Title="An XAML example"
           Height="500"
           Width ="850"
           WindowStartupLocation="CenterScreen"
 >

    <Window.Background>
        <SolidColorBrush Opacity="0.8" Color="#FFbb33"/>
    </Window.Background>

    <Grid
        Height              ="500"
        Width               ="800"
        VerticalAlignment   ="Top"
        HorizontalAlignment ="Center" Margin="10,10,10,10"
    >

        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="150*"/>
            <ColumnDefinition Width="150*"/>
            <ColumnDefinition Width="150*"/>
            <ColumnDefinition Width="150*"/>
        </Grid.ColumnDefinitions>

        <Grid.RowDefinitions>
            <RowDefinition Height="100*"/>
            <RowDefinition Height="200*"/>
            <RowDefinition Height="58*"/>
        </Grid.RowDefinitions>

        <Label  Name="labelEN" Content="Text"             Margin="10,20,105,0"  VerticalAlignment="Top" Width="550" HorizontalAlignment="left" FontFamily="Calibri" FontSize="20" Grid.RowSpan="2" Foreground="#cc0000" Grid.ColumnSpan="4" Grid.IsSharedSizeScope="True"/>
        <Label  Name="labelDE" Content="More text"        Margin="10,60,105,0"  VerticalAlignment="Top" Width="550" HorizontalAlignment="left" FontFamily="Calibri" FontSize="20" Grid.RowSpan="2" Foreground="#bb0000" Grid.ColumnSpan="4" Grid.IsSharedSizeScope="True"/>
        <Label  Name="labelFR" Content="Even more text"   Margin="10,100,105,0" VerticalAlignment="Top" Width="550" HorizontalAlignment="left" FontFamily="Calibri" FontSize="20" Grid.RowSpan="2" Foreground="#aa0000" Grid.ColumnSpan="4" Grid.IsSharedSizeScope="True"/>
        <Label  Name="labelIT" Content="Sufficient text?" Margin="10,140,105,0" VerticalAlignment="Top" Width="550" HorizontalAlignment="left" FontFamily="Calibri" FontSize="20" Grid.RowSpan="2" Foreground="#990000" Grid.ColumnSpan="4" Grid.IsSharedSizeScope="True"/>

        <Button Name="buttonEN" Content="one&#xa;eins"    Margin="0,0,0,0" VerticalAlignment="Center" Width="150" Height="150" FontFamily="Calibri" FontSize="22"  Foreground="#3300ff10" Background="#dd994422" Grid.Row="1" Grid.RowSpan="2" Grid.Column="0" BorderBrush="#66DDBD30" BorderThickness="3"/>
        <Button Name="buttonDE" Content="two&#xa;zwei"    Margin="0,0,0,0" VerticalAlignment="Center" Width="150" Height="150" FontFamily="Calibri" FontSize="22"  Foreground="#3300ff10" Background="#dd994422" Grid.Row="1" Grid.RowSpan="2" Grid.Column="1" BorderBrush="#66DDBD30" BorderThickness="3"/>
        <Button Name="buttonFR" Content="three&#xa;drei"  Margin="0,0,0,0" VerticalAlignment="Center" Width="150" Height="150" FontFamily="Calibri" FontSize="22"  Foreground="#3300ff10" Background="#dd994422" Grid.Row="1" Grid.RowSpan="2" Grid.Column="2" BorderBrush="#66DDBD30" BorderThickness="3"/>
        <Button Name="buttonIT" Content="four&#xA;vier"   Margin="0,0,0,0" VerticalAlignment="Center" Width="150" Height="150" FontFamily="Calibri" FontSize="22"  Foreground="#3300ff10" Background="#dd994422" Grid.Row="1" Grid.RowSpan="2" Grid.Column="3" BorderBrush="#66DDBD30" BorderThickness="3"/>
    </Grid>
</Window>

'@


[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')

$reader=(New-Object System.Xml.XmlNodeReader $xaml)
$Form=[Windows.Markup.XamlReader]::Load( $reader )

"Form.type: $($Form.GetType().FullName)" # --> System.Windows.Window

#Add Form objects as script variables
$xaml.SelectNodes("//*[@Name]") | foreach-object {
      Set-Variable -Name ($_.Name) -Value $Form.FindName($_.Name)
}

$buttonDE.GetType().FullName

$buttonDE.Add_Click({
    $form.Content = "German was selected.`n`n`nRightclick window to exit"

#    $ChoiceRTN =  [System.Windows.Forms.MessageBox]::Show('de','DE',4,[System.Windows.Forms.MessageBoxIcon]::Question)
#   ###Set-WinUserLanguageList "de-CH" -force
#
#   Set-WinUILanguageOverride "de-CH"
#   Set-Culture "de-CH"
#   Set-WinSystemLocale "de-CH"
#   Set-WinHomeLocation $(Get-GeoId("de-CH")) #Country setting (will display Switzerland)
#   Set-WinUserLanguageList "de-CH" -force

#   #Ask user if he wants to logoff so the language settings are applied
#   $form.close()
#   getchoice
})


$buttonEN.Add_Click({
    $form.Content = "EN was selected.`n`n`nRightclick window to exit"
})

$buttonFR.Add_Click({
    $form.Content = "EN was selected.`n`n`nRightclick window to exit"
})

$buttonIT.Add_Click({
    $form.Content = "EN was selected.`n`n`nRightclick window to exit"
})


$Form.ShowDialog() | out-null
