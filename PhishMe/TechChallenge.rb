#!/usr/bin/ruby
#
# Karl G Chavarria
# 02/06/2016
#
# TechChallenge.rb: This is the actual file that pulls everything together and allows for running of individual RSpec
# tests, or all tests at once.
#

require_relative 'spec_helper'

setup = TestSetup.new()

describe "Tests to verify Google.com search results" do
  let(:test_url){@setup.test_url}
  let(:search_page){ Search.new(@driver) }

  before(:all) do
    @setup = TestSetup.new
  end

  before(:each) do
    @driver = @setup.make_driver
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to(test_url)
  end

  after(:each) do
    @driver.close
  end


  setup.input_list.each do |search_term|
    it "Navigate to Google.com and search for #{search_term}.  Verify that a valid Wikipedia result is present on first page" do
      search_page.run_search(search_term, "Wikipedia")
      expect(search_page.includes_wiki_results).to be true
    end
  end

end