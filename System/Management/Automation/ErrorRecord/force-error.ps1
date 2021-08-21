# set-strictMode -version 1

function print-errorRecord {
   param (
      [System.Management.Automation.ErrorRecord] $er
   )

   "CategoryInfo              $($er.CategoryInfo.GetType().FullName)"
   "  Activity              = $($er.CategoryInfo.Activity)"
   "  Category              = $($er.CategoryInfo.Category)"
   "  Reason                = $($er.CategoryInfo.Reason)"
   "  TargetName            = $($er.CategoryInfo.TargetName)"
   "  TargetType            = $($er.CategoryInfo.TargetType)"

#  "ErrorDetails                 $($er.ErrorDetails.          GetType().FullName)"


   ''
   "Exception                 $($er.Exception.GetType().FullName)"
   "  Data                  = $($er.Exception.Data)"
   "  HelpLink              = $($er.Exception.HelpLink)"
   "  HResult               = $($er.Exception.HResult)"
   "  InnerException        = $($er.Exception.InnerException)"
   "  Message               = $($er.Exception.Message)"
   "  Source                = $($er.Exception.Source)"
#  "  StackTrace            = $($er.Exception.StackTrace)"
   "  TargetSite            = $($er.Exception.TargetSite)"

   ''
   "FullyQualifiedErrorId   = $($er.FullyQualifiedErrorId)"

   ''
   "InvocationInfo            $($er.InvocationInfo.GetType().FullName)"
   "  BoundParameters       = $($er.InvocationInfo.BoundParameters)"
   "  CommandOrigin         = $($er.InvocationInfo.CommandOrigin)"
   "  DisplayScriptPosition = $($er.InvocationInfo.DisplayScriptPosition)"
   "  ExpectingInput        = $($er.InvocationInfo.ExpectingInput)"
   "  HistoryId             = $($er.InvocationInfo.HistoryId)"
   "  InvocationName        = $($er.InvocationInfo.InvocationName)"
#  "  Line                  = $($er.InvocationInfo.Line)"
   "  MyCommand             = $($er.InvocationInfo.MyCommand)"
   "  OffsetInLine          = $($er.InvocationInfo.OffsetInLine)"
   "  PipelineLength        = $($er.InvocationInfo.PipelineLength)"
   "  PipelinePosition      = $($er.InvocationInfo.PipelinePosition)"
#  "  PositionMessage       = $($er.InvocationInfo.PositionMessage)"
   "  PSCommandPath         = $($er.InvocationInfo.PSCommandPath)"
   "  PSScriptRoot          = $($er.InvocationInfo.PSScriptRoot)"
   "  ScriptLineNumber      = $($er.InvocationInfo.ScriptLineNumber)"
   "  ScriptName            = $($er.InvocationInfo.ScriptName)"
   "  UnboundArguments      = $($er.InvocationInfo.UnboundArguments)"

   ''
   "PipelineIterationInfo     $($er.PipelineIterationInfo.GetType().FullName)"

   "ScriptStackTrace          $($er.ScriptStackTrace.GetType().FullName)"
   "TargetObject              $($er.TargetObject.GetType().FullName)"



}

$errorActionPreference = 'stop'

try {
   get-item t:\this\file\or\drive\does\probably\not\ex.ist
}
catch {
   print-errorRecord $_
}
