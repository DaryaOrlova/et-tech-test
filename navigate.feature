Feature: Check navigation by pages

  Scenario: Check navigation by sections
    Given I have opened "/"
    And I navigate to page "for sale"
    Then I should be redirected to URL "/search/sss"

  Scenario: Check navigation by categories
    Given I have opened "/"
    And I navigate to page "software / qa / dba"
    Then I should be redirected to URL "/search/sof"

  Scenario: Check navigation by area
    Given I have opened "/"
    And I navigate to subarea "amsterdam" in area "europe"
    Then I should be redirected to new domain "http://amsterdam.craigslist.org/"
