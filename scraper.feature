Feature: Scrape the list of titles and urls.
	 On the first run test lists off the list of titles and urls through the chosen format (json, yaml, csv) and store the values in a file. 
	 On subsequent runs test prints the "new" and "removed" entries in console. Then test updates the stored data file with new and removed entries. 

  Scenario: Scrape the list of titles and urls.
    Given I have opened "/"
    And return list of titles and urls formatted as "json"
    #And return list of titles and urls formatted as "csv"
    #And return list of titles and urls formatted as "yaml"
