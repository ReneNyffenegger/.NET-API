[int32]  $int_32 = 4100

[byte[]] $bytes  = [System.BitConverter]::GetBytes($int_32)

$bytes -join ', '
#
#  4, 16, 0, 0
