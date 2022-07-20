#!/usr/bin/ruby
#
# Karl G Chavarria
# 11/17/2020
#
# spec_helper.rb: This spec_helper file is for storing and setting config settings in Rspec if needed.
#

require 'json'
require 'rspec'
require 'selenium-webdriver'
require_relative 'BarkPageObjects'
require_relative 'Purchase'
require_relative 'TestSetup'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
