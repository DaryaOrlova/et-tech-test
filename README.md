Task:
=====================
* Please create a working cucumber automated test project.
* One or more gherkin files should be included.
* Ruby, page objects and selenium web-driver must be used within your test code.
* The target system to test is www.craigslist.com
* You must create a working scenario outline which allows the user to navigate by example variables to a particular area, subarea, section and category. 
* On the first run for each example row, the automated test should list off the returned list of titles and urls through the chosen formatter output and store the values inside of a file. 
* On subsequent runs the formatter output should list off only the "new" entries to the search result. These runs should also clean up the stored data file by adding the new entries and deleting any removed entries.


Requirements:
=====================
* Ruby
* Cucumber
* Capybara
* Selenium WebDriver
* Firefox

Usage:
=====================
* Run Selenium WebDriver
```
java -jar /var/selenium/selenium-server-standalone-3.0.0-beta3.jar
```
* Run 
```
cucumber features
```

