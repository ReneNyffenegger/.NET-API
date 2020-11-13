$src = get-content -raw PInvoke.cs

add-type -typeDefinition $src

$acc = [TQ84.COM]::getActiveObject('Access.Application')
