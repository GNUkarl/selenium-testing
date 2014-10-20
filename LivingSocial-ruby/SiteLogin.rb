#!/usr/bin/ruby
#
# Karl G Chavarria
# 10/20/2014
#
# SiteLogin: Class made for doing preliminary login before executing a test on the livingsocial site
# This class takes URL (http://login.livingsocial.com), username (email@site.com) and password (self-explanatory)
# as arguments.

require "selenium-webdriver"

class SiteLogin

	def initialize(url,username,password)
    @url=url
    @username=username
    @password=password
	end

	def login()

    # Instantiating the WebDriver as Chrome, assigning the "incognito" command line option
    driver = Selenium::WebDriver.for :chrome, :switches => %w[-incognito]

    # Navigating to the supplied URL
    driver.navigate.to(@url)

    # Fill in the email and password fields and then press enter
    email_field = driver.find_element(:id, 'login_email')
    email_field.click
    email_field.send_keys(@username)
    pass_field = driver.find_element(:id, 'login_password')
    pass_field.click
    pass_field.send_keys(@password)
    pass_field.submit
	end

end
