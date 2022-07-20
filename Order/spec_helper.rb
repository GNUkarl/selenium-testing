#!/usr/bin/ruby
#
# Karl G Chavarria
# 04/09/2022
#
# spec_helper.rb: This spec_helper file is for storing and setting config settings in Rspec if needed.
#

require 'json'
require 'rspec'
require 'selenium-webdriver'
require_relative 'IndigoPageObjects'
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
