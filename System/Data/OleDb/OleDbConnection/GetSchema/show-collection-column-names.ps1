param (
   [System.Data.OleDb.OleDbConnection] $conn
)

set-strictMode -version latest

function write-dataTableColumns {
   param (
      [System.Data.DataTable] $dt
   )

#  write-host "$($dt.TableName)"

   [System.Data.DataColumnCollection] $cols = $dt.Columns
   foreach ($col in $cols) {
       write-host "   $($col.ColumnName)"
   }
}


[System.Data.DataTable] $schema = $conn.GetSchema()

write-dataTableColumns $schema

foreach ($collection in $schema.Rows) {
    $collName = $collection['CollectionName']
    write-host ''
    write-host "Collection name:             $collName"
    write-host " Number of Restrictions:     $($collection['NumberOfRestrictions'])"
    write-host " Number of Identifier parts: $($collection['NumberOfIdentifierParts'])"

    try {
     #
     # Some calls to GetSchema() cause
     #     Exception calling "GetSchema" with "1" argument(s):
     #    "Operation is not supported for this type of object."
     #
        $collSchema = $conn.GetSchema($collName)
    }
    catch {
        "Could not get schema for $collname"
         $collSchema = $null
    }
    if ($collSchema -ne $null) {
        write-dataTableColumns  $collSchema
    }
}
