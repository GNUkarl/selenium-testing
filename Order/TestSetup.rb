#!/usr/bin/ruby
#
# Karl G Chavarria
# 04/09/2022
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
      # Instantiating the WebDriver as Chrome
      driver = Selenium::WebDriver.for :chrome

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

  def test_pass
    @config_hash['config']['test_pass']
  end

  def search_1
    @config_hash['config']['search_1']
  end

  def search_2
    @config_hash['config']['search_2']
  end

  def top_items
    @config_hash['config']['top_items']
  end

end
