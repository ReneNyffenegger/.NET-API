//
//  csc -nologo App.cs
//
using System;
using System.Configuration;

namespace TQ84  {

  class App  {

    static void Main(string[] args) {

      Configuration                   configFile = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
      KeyValueConfigurationCollection settings_  = configFile.AppSettings.Settings;

      string numRuns_;

      if (settings_["numRuns"] == null)  {
          numRuns_ = "1";
          settings_.Add("numRuns", numRuns_);
      }
      else  {
          int numRuns = Int32.Parse(settings_["numRuns"].Value);
          numRuns++;
          numRuns_ = Convert.ToString(numRuns, 10);

          settings_["numRuns"].Value = numRuns_;
      }

      Console.WriteLine("The application was run {0} time(s)", numRuns_);

      configFile.Save(ConfigurationSaveMode.Modified);
    }
  }
}
