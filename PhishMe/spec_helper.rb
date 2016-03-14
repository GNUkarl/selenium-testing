#!/usr/bin/ruby
#
# Karl G Chavarria
# 02/06/2016
#
# spec_helper.rb: This spec_helper file is for storing and setting config settings in Rspec if needed.
#

require 'json'
require 'rspec'
require 'selenium-webdriver'
require_relative 'GooglePageObjects'
require_relative 'Search'
require_relative 'TestSetup'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
