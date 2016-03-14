#!/usr/bin/ruby
#
# Karl G Chavarria
# 02/06/2016
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

  def input_list # Creates an input list array from search terms input
    input = Array.new
    IO.foreach(@config_hash['config']['text_input_file']) do |line|
      input.push(line.chomp())
    end
    input
  end

  def browser # Reads the config file and parses browser option
    @config_hash['config']['browser'].downcase
  end

  def test_url # Reads the config file and parses the test URL option
    @config_hash['config']['test_url'].downcase
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



end
