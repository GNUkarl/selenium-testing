#!/usr/bin/ruby
#
# Karl G Chavarria
# 11/17/2020
#
# Purchase.rb: This class contains methods for running through the Super Chewer purchase flow
#

require_relative 'spec_helper'

class Purchase

  def initialize(driver)
    @driver = driver
    @bark = BarkPageObjects.new(@driver)
    @tax_displayed = false # Defaulting this to false to the test fails unless the element is actually displayed
    @tax_applied = false
  end


  def tax_displayed_properly # Method for passing @tax_displayed boolean to main TechChallenge class
    if @tax_displayed
      true
    else
      false
    end
  end

  def tax_applied_properly # Method for passing @tax_pplied boolean to main TechChallenge class
    if @tax_applied
      true
    else
      false
    end
  end

  def tax_parse (tax_percentage) # Method for logically determining @tax_applied and @tax_displayed values
    sleep(1)
    if ((tax_percentage/100) * @bark.shipping_price).ceil(2) == @bark.shipping_tax_value
      @tax_applied = true
    end

    if @driver.page_source.include? "8.875%"
      @tax_displayed = true
    end
  end

  def make_purchase (dog_name,test_email,first_name,last_name,street_address,city,state,zip,tax_percentage)
    claim_offer
    input_dog_name(dog_name)
    select_dog_size
    select_dog_breed
    input_dog_birthday
    select_dog_allergies
    input_email(test_email)
    choose_plan
    extra_toy
    choose_theme
    checkout(first_name,last_name,street_address,city,state,zip)
    tax_parse(tax_percentage)
  end

# Below each step of the purchase flow is abstracted into its own method for easier readability and updating
#

  def claim_offer
    sleep(1)
    @bark.claim_offer_button.click
  end

  def input_dog_name(dog_name)
    sleep(1)
    @bark.dog_button_male.click
    @bark.dog_name_field.click
    @bark.dog_name_field.send_keys(dog_name)
    @bark.dog_name_continue_button.click
  end

  def select_dog_size
    sleep(1)
    @bark.dog_weight_medium_button.click
  end

  def select_dog_breed
    sleep(1)
    @bark.dog_breed_skip.click
  end

  def input_dog_birthday
    sleep(1)
    @bark.dog_birthday_skip.click
  end

  def select_dog_allergies
    sleep(1)
    @bark.dog_allergy_no_exclusions.click
    @bark.dog_allergy_continue_button.click
  end

  def input_email(test_email)
    sleep(1)
    @bark.email_field.click
    @bark.email_field.send_keys(test_email)
    @bark.email_updates_checkbox.click
    @bark.email_continue_button.click
  end

  def choose_plan
    sleep(1)
    @bark.monthly_subscription_button.click
  end

  def extra_toy
    sleep(1)
    @bark.no_extra_toy_button.click
  end

  def choose_theme
    sleep(1)
    @bark.surprise_me_button.click
  end

  def checkout(first_name,last_name,street_address,city,state,zip)
    sleep(1)
    @bark.credit_card_option_button.click
    @bark.shipping_first_name_field.click
    @bark.shipping_first_name_field.send_keys(first_name)
    @bark.shipping_last_name_field.click
    @bark.shipping_last_name_field.send_keys(last_name)
    @bark.shipping_street_field.click
    @bark.shipping_street_field.send_keys(street_address)
    @bark.shipping_city_field.click
    @bark.shipping_city_field.send_keys(city)
    @bark.shipping_state_dropdown.click
    @bark.shipping_state_dropdown.send_keys(state)
    @bark.shipping_zip_code_field.click
    @bark.shipping_zip_code_field.send_keys(zip)
  end

end

