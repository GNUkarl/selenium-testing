#!/usr/bin/ruby
#
# Karl G Chavarria
# 10/20/2014
#
# Test1: Navigate to My Account
# - logs into livingsocial.com, navigates to "My Account" and verifies page title

require "selenium-webdriver"
require_relative "ConfigFile"


class Test1

config=ConfigFile.new("login.txt") # Instantiating my ConfigFile class and reading login info from a text file
config.checkexist

url="http://login.livingsocial.com"
username=config.email
password=config.pass
expected_title="My Account - LivingSocial" # Expected page title for test to qualify as passing

  # Instantiating the WebDriver as Chrome, assigning the "incognito" command line option
  driver = Selenium::WebDriver.for :chrome, :switches => %w[-incognito]

  # Navigating to the Livingsocial login site.
  driver.navigate.to(url)

  # Fill in the email and password fields and then press enter
  email_field = driver.find_element(:id, 'login_email')
  email_field.click
  email_field.send_keys(username)
  pass_field = driver.find_element(:id, 'login_password')
  pass_field.click
  pass_field.send_keys(password)
  pass_field.submit

  # After login, click on the username drop-down
  drop_down = driver.find_element(:id, 'my-account-dropdown')
  drop_down.click

  # Clicking on the "My Account" option in the drop-down (I need to find a more efficient xpath)
  my_account = driver.find_element(:xpath,"/html/body/header[@id='main-hdr']/nav/ul[@id='universal-nav-my-account']/li[@id='my-account-dropdown']/div[@class='dropdown-wrap mobile-hide']/div[@class='dropdown']/ul[@class='unstyled']/li[@class='my-account']/a").click


  # Actual basic test. I'm still researching test frameworks for Ruby and looking for something that supports setup/teardown like JUnit

  if driver.title == expected_title
    puts "\nTEST PASSED\n\n"
    puts "Page title is #{driver.title}"
  else
    puts "\nTEST FAILED\n\n"
    puts "Page title is #{driver.title}"
  end

  driver.quit

end
