#!/usr/bin/ruby
#
# Karl G Chavarria
# 02/06/2016
#
# GooglePageObjects.rb: This class includes elements from the search page that have been converted into methods for
# future use by other classes.
#

require_relative 'spec_helper'

class GooglePageObjects

  def initialize(driver)
    @driver = driver
  end

  def search_box
    @driver.find_element(:id, "lst-ib")
  end

  def result_titles
    @driver.find_elements(:css, ".r>a")
  end

  def result_descriptions
    @driver.find_elements(:css, ".st")
  end
end