class cls {
   [int   ] $num
   [string] $txt

   cls(
     [int   ] $n,
     [string] $t
    ) {
      $this.num = $n
      $this.txt = $t
    }
}

#
#  Create the list and specify the type of
#  the elements that can be inserted to the list:
#
$list = new-object System.Collections.Generic.List[cls]

#
#  Create two object of that specific type …
#
$obj_1 = [cls]::new(1, 'foo')
$obj_2 = [cls]::new(2, 'bar')

#
#  … and insert (add) them to the list:
#
$list.add($obj_1)
$list.add($obj_2)

#
#  Add another object more directly:
#
$list.add([cls]::new(3, 'baz'))

#
#  The objects are references. So, when an object is changed
#  outside of the list, its modification will be reflected
#  further down where the iteration over the list takes place.
#
$obj_2.txt = 'changed'

#
#  Iterate over the list's elements and
#  print their member values:
#
foreach ($c in $list) {
   write-host "$($c.num) $($c.txt)"
}
#
# 1 foo
# 2 changed
# 3 baz
