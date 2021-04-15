$matches = [regex]::match('  one two three ', '((\w+) +(\w+) +(\w+))')

"Matched string starts at position $($matches.Index) and has $($matches.Length) characters"

"  1st group: $($matches.Groups[2].value)"
"  2nd group: $($matches.Groups[3].value)"
"  3rd group: $($matches.Groups[4].value)"

#
#  Matched string starts at position 2 and has 13 characters
#    1st group: one
#    2nd group: two
#    3rd group: three
