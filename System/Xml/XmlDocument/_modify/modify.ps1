function get-or-create-elem-with-id($doc, $id) {

   $elem = $doc.SelectSingleNode("/rt/item[@id='$id']")

   if ($elem -eq $null) {
      $elem = $doc.CreateElement('elem')
      $elem.SetAttribute('id', $id)

      $null = $doc.SelectSingleNode('/rt').AppendChild($elem)
   }

   return $elem
}


function create-val-if-not-exists($elem, $valName, $doc) {

     if ($elem.SelectSingleNode($valName) -eq $null) {

        $val = $doc.CreateElement($valName)
        $val.InnerText = 'created'

        $null = $elem.AppendChild($val)
     }
}


[xml] $doc = new-object xml
$doc.Load("$pwd/orig.xml")

foreach ($id in 'foo', 'bar', 'baz') {

   $elem = get-or-create-elem-with-id $doc  $id


   create-val-if-not-exists $elem 'valOne' $doc
   create-val-if-not-exists $elem 'valTwo' $doc
}

$doc.Save("$pwd/modified.xml")
type modified.xml
