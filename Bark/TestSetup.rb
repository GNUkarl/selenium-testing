#!/usr/bin/ruby
#
# Karl G Chavarria
# 11/17/2020
#
# TestSetup.rb: This class is for maintenance tasks that directly support testing (drivers, config files, etc.)
#

require_relative 'spec_helper'

class TestSetup

  def initialize
    @usage_message = "\nInvalid config. Exiting.\n"

    if File.exist?("config.json")
      @config = File.read("config.json")
      @config_hash = JSON.parse(@config)

      if @config_hash.has_key?("config")
      else
        puts @usage_message
        exit
      end
    else
      puts @usage_message
      exit
    end
  end

  def make_driver # Method for choosing test browser

    if browser == "chrome"
      # Instantiating the WebDriver as Chrome, assigning the "incognito" command line option
      driver = Selenium::WebDriver.for :chrome, :switches => %w[-incognito -start-maximized]

    elsif browser == "firefox"
      # Instantiating the WebDriver as Firefox, by default Firefox driver uses it's own Firefox session
      driver = Selenium::WebDriver.for :firefox
    else
      puts @usage_message
      exit
    end

    driver

  end

# Importing values from json config file
#

  def browser
    @config_hash['config']['browser'].downcase
  end

  def test_url
    @config_hash['config']['test_url']
  end

  def test_email
    @config_hash['config']['test_email']
  end

  def dog_name
    @config_hash['config']['dog_name']
  end

  def first_name
    @config_hash['config']['first_name']
  end

  def last_name
    @config_hash['config']['last_name']
  end

  def street_address
    @config_hash['config']['street_address']
  end

  def city
    @config_hash['config']['city']
  end

  def state
    @config_hash['config']['state']
  end

  def zip
    @config_hash['config']['zip']
  end

  def tax_percentage
    @config_hash['config']['tax_percentage'].to_f
  end

end
