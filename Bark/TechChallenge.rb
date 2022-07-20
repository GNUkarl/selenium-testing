#!/usr/bin/ruby
#
# Karl G Chavarria
# 11/17/2020
#
# TechChallenge.rb: This is the actual file that pulls everything together and allows for running of individual RSpec
# tests, or all tests at once.
#

require_relative 'spec_helper'

setup = TestSetup.new()

describe "Tests to verify Super Chewer purchase tax" do
  let(:test_url){@setup.test_url}
  let(:test_email){@setup.test_email}
  let(:dog_name){@setup.dog_name}
  let(:first_name){@setup.first_name}
  let(:last_name){@setup.last_name}
  let(:street_address){@setup.street_address}
  let(:city){@setup.city}
  let(:state){@setup.state}
  let(:zip){@setup.zip}
  let(:tax_percentage){@setup.tax_percentage}
  let(:purchase_page){ Purchase.new(@driver) }

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

  it "Navigate to the Super Chewer checkout page. Verify that NY sales tax is applied correctly" do
    purchase_page.make_purchase(dog_name,test_email,first_name,last_name,street_address,city,state,zip,tax_percentage)
    expect(purchase_page.tax_applied_properly).to be true
  end

  it "Navigate to the Super Chewer checkout page. Verify that proper NY sales tax is displayed " do
    purchase_page.make_purchase(dog_name,test_email,first_name,last_name,street_address,city,state,zip,tax_percentage)
    expect(purchase_page.tax_displayed_properly).to be true
  end

end

