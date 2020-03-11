[System.Collections.Generic.Dictionary[String, Int]] $wordCount = new-object 'System.Collections.Generic.Dictionary[String, Int]'

foreach ($item in 'three', 'four', 'four', 'two', 'four', 'three', 'one', 'two', 'four', 'three') {
   $wordCount[$item] = $wordCount[$item] + 1
}

[System.Linq.Enumerable]::OrderBy(
    $wordCount,
    [Func[ System.Collections.Generic.KeyValuePair[String, Int] , # This is the type of $p in the next anonymous code block
           Int                                                    # This is tye type of what the anonymous code block returns
   ]] { param($p) $p.Value })
