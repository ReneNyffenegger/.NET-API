foreach ($factoryClass in [System.Data.Common.DbProviderFactories]::GetFactoryClasses()) {

   write-host "$($factoryClass.description) ($($factoryClass.name))"

   $factory = [System.Data.Common.DbProviderFactories]::GetFactory($factoryClass.InvariantName)

   "  CanCreateDataSourceEnumerator: $($factory.CanCreateDataSourceEnumerator)"


   if ($psVersionTable.psEdition -eq 'Core') {
    #
    # Apparently, the following properites are only available in .NET Core.
    #
      "  CanCreateCommandBuilder      : $($factory.CanCreateCommandBuilder      )"
      "  CanCreateDataAdapter         : $($factory.CanCreateDataAdapter         )"
   }

   write-host
}
