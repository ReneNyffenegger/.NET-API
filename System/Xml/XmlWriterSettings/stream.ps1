set-strictMode -version latest

[System.IO.Stream]             $stream   = [System.IO.File]::Create("$pwd\test.xml")
[System.Xml.XmlWriterSettings] $settings = new-object System.Xml.XmlWriterSettings

$settings.Indent        = $true
$settings.IndentChars   = '   '

$xmlWriter = [System.Xml.XmlWriter]::Create($stream, $settings);

$xmlWriter.WriteStartDocument()
$xmlWriter.WriteComment("Created at $(get-date -UFormat '%F' )")

$xmlWriter.WriteStartElement('rt')
$XmlWriter.WriteAttributeString('attr', 'val')

for ($id=1; $id -le 3; $id++) {

    $xmlWriter.WriteStartElement('elem')
    $xmlWriter.WriteAttributeString('id', $id)

       $xmlWriter.WriteElementString('foo', -join ( [byte][char]'a' .. [byte][char]'z' | foreach-object {[char] $_} | get-random -count (get-random -minimum 4 -maximum 10) ) )
       $xmlWriter.WriteElementString('bar', $id -eq 2)
       $xmlWriter.WriteElementString('baz', 'x' * $id )

    $xmlWriter.WriteEndElement()
}

$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndDocument()

$xmlWriter.Flush()
$xmlWriter.Close()
$stream.Close()
