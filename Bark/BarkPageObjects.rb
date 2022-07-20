#!/usr/bin/ruby
#
# Karl G Chavarria
# 11/17/2020
#
# BarkPageObjects.rb: This class includes elements from the purchase flow pages that have been converted into methods
# for future use by other classes.
#

require_relative 'spec_helper'

class BarkPageObjects

  def initialize(driver)
    @driver = driver
  end

  def claim_offer_button
    @driver.find_element(:css, "#hero-ctas > a.button.cta")
  end

  def dog_button_male
    @driver.find_element(:id, "male")
  end

  def dog_name_field
    @driver.find_element(:css, "#subscription_dog_name_dog_name")
  end

  def dog_name_continue_button
    @driver.find_element(:css, "#dog-name-submit")
  end

  def dog_weight_medium_button
    @driver.find_element(:css, "#size > div:nth-child(2) > div")
  end

  def dog_breed_skip
    @driver.find_element(:css, "#edit_subscription_dog_breed > div.flex.flex-center-horizontal.breeds-wrapper > a")
  end

  def dog_birthday_skip
    @driver.find_element(:css, "#edit_subscription_dog_birthday > div.birthday-wrapper > div.top-x-mini > a")
  end

  def dog_allergy_no_exclusions
    @driver.find_element(:css, "#edit_subscription_allergy_selection > div.allergy-options > div.boolean.optional.subscription_allergy_selection_no_exclusions")
  end

  def dog_allergy_continue_button
    @driver.find_element(:css, "#edit_subscription_allergy_selection > button")
  end

  def email_field
    @driver.find_element(:css, "#subscription_email_email")
  end

  def email_updates_checkbox
    @driver.find_element(:css, "#edit_subscription_email > div.boolean.optional.subscription_email_marketing_opt_in.top-mini > label > p")
  end

  def email_continue_button
    @driver.find_element(:css, "#edit_subscription_email > input.top-mini.full-mobile.btn.onboarding-button")
  end

  def monthly_subscription_button
    @driver.find_element(:css, "#duration > div.sc2-2020q4 > div:nth-child(3)")
  end

  def no_extra_toy_button
    @driver.find_element(:css, "#extra-toy > div.col.half.right.top > div.col.half.top.right-mini > button")
  end

  def surprise_me_button
    @driver.find_element(:css, "#edit_subscription_cart > div:nth-child(7) > div > div > button")
  end

  def credit_card_option_button
    @driver.find_element(:css, "#credit-card")
  end

  def shipping_first_name_field
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_first_name")
  end

  def shipping_last_name_field
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_last_name")
  end

  def shipping_street_field
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_street1")
  end

  def shipping_city_field
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_city")
  end

  def shipping_state_dropdown
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_state")
  end

  def shipping_zip_code_field
    @driver.find_element(:css, "#subscription_express_checkout_address_attributes_zip")
  end

  def shipping_tax_element
    @driver.find_element(:css, "#summary > div > div.summary-details > div.line-item.tax")
  end

# The below methods also include a bit of regex to strip dollar signs so the values can be manipulated mathematically
#
  def shipping_price
    @driver.find_element(:css,"#summary > div > div.summary-details > div.line-item.hide-from-bright > span.value > p").text.tr!('$,','').to_f
  end

  def shipping_tax_value
    @driver.find_element(:css, "#summary > div > div.summary-details > div.line-item.tax > span.value > p").text.tr!('$,','').to_f
  end

  def shipping_total
    @driver.find_element(:css, "#summary > div > div.summary-details > div.summary-footer.summary_header > p.value").text.tr!('$,','').to_f
  end
end