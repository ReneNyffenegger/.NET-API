$dict = new-object 'System.Collections.Generic.Dictionary[String, String]'
$dict['Fruit'] = 'Orange'
$dict['City' ] = 'Paris'
$dict['Make' ] = 'BWM'

foreach ($key in $dict.keys) {
   "$key -> $($dict[$key])"
}
