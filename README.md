Task:
1. Please create a working cucumber automated test project.
2. One or more gherkin files should be included.
3. Ruby, page objects and selenium web-driver must be used within your test code.
4. The target system to test is www.craigslist.com
5. You must create a working scenario outline which allows the user to navigate by example variables to a particular area, subarea, section and category. 
6. On the first run for each example row, the automated test should list off the returned list of titles and urls through the chosen formatter output and store the values inside of a file. 
7. On subsequent runs the formatter output should list off only the "new" entries to the search result. These runs should also clean up the stored data file by adding the new entries and deleting any removed entries.


Requirements:
1. Ruby
2. Cucumber
3. Capybara
4. Selenium Web Server
5. Firefox

Usage:
1. Run Selenium Web Server
java -jar /var/selenium/selenium-server-standalone-3.0.0-beta3.jar
2. Run 
cucumber features

