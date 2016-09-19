require 'selenium-webdriver'
require 'capybara/cucumber'

require 'uri'
require 'capybara/rspec'
require 'pp'
require 'json'
require 'csv'
#require 'uri'


Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://craigslist.com'
  config.page.driver.browser.manage.window.maximize
end


After do |scenario| 
    if scenario.failed? 
        puts scenario.name
        puts scenario.exception.message        
    end 
end



