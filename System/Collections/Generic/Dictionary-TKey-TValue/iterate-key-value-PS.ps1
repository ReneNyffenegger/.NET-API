$dict = new-object 'System.Collections.Generic.Dictionary[String, Int32]'

$dict['forty-two'  ] = 42
$dict['ninety-nine'] = 99
$dict['minus one'  ] = -1


foreach ($item in $dict.GetEnumerator()) {
    "{0,-11}: {1}" -f $item.key, $item.value
}
#
# forty-two  : 42
# ninety-nine: 99
# minus one  : -1
