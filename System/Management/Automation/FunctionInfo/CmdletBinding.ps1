function normal-function {
  param()
   42
}

function advanced-function {
 [CmdLetBinding()]
  param()

 'Hello World'
}

(get-command   normal-function).CmdletBinding
#
# False

(get-command advanced-function).CmdletBinding
#
# True
