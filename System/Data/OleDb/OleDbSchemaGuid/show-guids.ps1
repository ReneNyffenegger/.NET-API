$type = [System.Data.OleDb.OleDbSchemaGuid]

foreach ($fld in $type.GetFields() | sort-object { $_.name}) {
    $fldName = $fld.name
   '{0,-30}: {1}' -f  $fldName, $type.GetField($fldName).GetValue($null)
}

#
#  Assertions                    : c8b52210-5cf3-11ce-ade5-00aa0044773d
#  Catalogs                      : c8b52211-5cf3-11ce-ade5-00aa0044773d
#  Character_Sets                : c8b52212-5cf3-11ce-ade5-00aa0044773d
#  Check_Constraints             : c8b52215-5cf3-11ce-ade5-00aa0044773d
#  Check_Constraints_By_Table    : c8b52301-5cf3-11ce-ade5-00aa0044773d
#  Collations                    : c8b52213-5cf3-11ce-ade5-00aa0044773d
#  Column_Domain_Usage           : c8b5221b-5cf3-11ce-ade5-00aa0044773d
#  Column_Privileges             : c8b52221-5cf3-11ce-ade5-00aa0044773d
#  Columns                       : c8b52214-5cf3-11ce-ade5-00aa0044773d
#  Constraint_Column_Usage       : c8b52216-5cf3-11ce-ade5-00aa0044773d
#  Constraint_Table_Usage        : c8b52217-5cf3-11ce-ade5-00aa0044773d
#  DbInfoKeywords                : f3264c9c-1860-4dfe-b71b-2961b2ea91bd
#  DbInfoLiterals                : f3264c9d-1860-4dfe-b71b-2961b2ea91bd
#  Foreign_Keys                  : c8b522c4-5cf3-11ce-ade5-00aa0044773d
#  Indexes                       : c8b5221e-5cf3-11ce-ade5-00aa0044773d
#  Key_Column_Usage              : c8b52218-5cf3-11ce-ade5-00aa0044773d
#  Primary_Keys                  : c8b522c5-5cf3-11ce-ade5-00aa0044773d
#  Procedure_Columns             : c8b522c9-5cf3-11ce-ade5-00aa0044773d
#  Procedure_Parameters          : c8b522b8-5cf3-11ce-ade5-00aa0044773d
#  Procedures                    : c8b52224-5cf3-11ce-ade5-00aa0044773d
#  Provider_Types                : c8b5222c-5cf3-11ce-ade5-00aa0044773d
#  Referential_Constraints       : c8b52219-5cf3-11ce-ade5-00aa0044773d
#  SchemaGuids                   : f3264c9b-1860-4dfe-b71b-2961b2ea91bd
#  Schemata                      : c8b52225-5cf3-11ce-ade5-00aa0044773d
#  Sql_Languages                 : c8b52226-5cf3-11ce-ade5-00aa0044773d
#  Statistics                    : c8b52227-5cf3-11ce-ade5-00aa0044773d
#  Table_Constraints             : c8b5221a-5cf3-11ce-ade5-00aa0044773d
#  Table_Privileges              : c8b52222-5cf3-11ce-ade5-00aa0044773d
#  Table_Statistics              : c8b522ff-5cf3-11ce-ade5-00aa0044773d
#  Tables                        : c8b52229-5cf3-11ce-ade5-00aa0044773d
#  Tables_Info                   : c8b522e0-5cf3-11ce-ade5-00aa0044773d
#  Translations                  : c8b5222a-5cf3-11ce-ade5-00aa0044773d
#  Trustee                       : c8b522ef-5cf3-11ce-ade5-00aa0044773d
#  Usage_Privileges              : c8b52223-5cf3-11ce-ade5-00aa0044773d
#  View_Column_Usage             : c8b5222e-5cf3-11ce-ade5-00aa0044773d
#  View_Table_Usage              : c8b5222f-5cf3-11ce-ade5-00aa0044773d
#  Views                         : c8b5222d-5cf3-11ce-ade5-00aa0044773d
