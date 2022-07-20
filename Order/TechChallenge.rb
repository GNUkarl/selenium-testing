#!/usr/bin/ruby
#
# Karl G Chavarria
# 04/09/2022
#
# TechChallenge.rb: This is the actual file that pulls everything together and allows for running of individual RSpec
# tests, or all tests at once.
#

require_relative 'spec_helper'

setup = TestSetup.new()

describe "Tests to verify indigo.ca purchase flow" do
  let(:test_url){@setup.test_url}
  let(:test_email){@setup.test_email}
  let(:test_pass){@setup.test_pass}
  let(:search_1){@setup.search_1}
  let(:search_2){@setup.search_2}
  let(:top_items){@setup.top_items}
  let(:purchase_page){ Purchase.new(@driver) }

  before(:all) do
    @setup = TestSetup.new
  end

  before(:each) do
    @driver = @setup.make_driver
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to(test_url)
  end


  it "Navigate to the Indigo website. Verify account is logged in" do
    purchase_page.login(test_email,test_pass)
    expect(purchase_page.account_logged_in).to be true
  end

  it "Navigate to the Indigo website. Login and verify purchase flow" do
    purchase_page.login(test_email,test_pass)
    purchase_page.test_purchases(search_1,search_2,top_items)
    expect(purchase_page.purchase_flow_complete).to be true
  end

end

