#!/usr/bin/ruby
#
# Karl G Chavarria
# 04/09/2022
#
# Purchase.rb: This class contains methods for running through the indigo.ca purchase flow
#

require_relative 'spec_helper'

class Purchase

  def initialize(driver)
    @driver = driver
    @indigo = IndigoPageObjects.new(@driver)
    @logged_in = false
    @purchase_complete = false
  end

  def account_logged_in # Method for passing @logged_in boolean to main TechChallenge class
    if @logged_in
      true
    else
      false
    end
  end

  def purchase_flow_complete # Method for passing @purchase_complete boolean to main TechChallenge class
    if @purchase_complete
      true
    else
      false
    end
  end


  def login (test_email,test_pass) # Login to the Indigo website using supplied login info
    do_login
    input_email(test_email)
    input_pass(test_pass)
    complete_sign_in
    verify_login
    sleep(10) #added due to Captcha reasons
  end

  def test_purchases (search_1,search_2,top_items) # Abstracted method for testing purchase flow
    #make_purchase(search_1)
    sleep(1)
    make_purchase(search_2)
    make_purchase(top_items.to_i)
    goto_cart
    pickup
    checkout
    verify_purchase
    sleep(2)
  end

# Below each step of the purchase flow is abstracted into its own method for easier readability and updating
#
  def do_login
    @indigo.start_sign_in.click
  end

  def input_email(test_email)
    @indigo.email_field.click
    @indigo.email_field.send_keys(test_email)
  end

  def input_pass(test_pass)
    @indigo.password_field.click
    @indigo.password_field.send_keys(test_pass)
  end

  def complete_sign_in
    @indigo.sign_in_button.click
  end

  def verify_login # Method to verify the signed-in class exists, which means user is signed in
    if @indigo.signed_in.size < 0
      @logged_in = true
    end
  end

  def verify_purchase # Method to verify that the paypal purchase text displays, meaning purchase flow completed
    if @indigo.continue_to_paypal.size > 0
      @purchase_complete = true
    end
  end

  def make_purchase(input) # Accepts either text search queries, or numbers for "top 3 items"
    if (input.is_a? Numeric)
      @indigo.new_items
      multi_buy(input)
    else
      do_search(input)
      add_item
      close_side_disp
    end
  end

  def do_search (input) # Method for logic of performing a search on the Indigo site
    @indigo.search_bar.click
    sleep(1)
    @indigo.search_bar.send_keys(input)
    @indigo.search_bar.send_keys :enter
    @indigo.search_bar.clear
    @indigo.first_product.click
  end

  def add_item # Clicks "add item to cart"
    @indigo.add_to_cart.click
  end

  def close_side_disp # Closes cart pop-up after adding to cart
    @indigo.side_disp_x.click
  end

  def multi_buy(input) # Method for purchasing top 3, top 4, top 100, etc items on the page
    (1..input).each do |x|
      @driver.action.move_to(@driver.find_element(:css, ".product-list__product--grid:nth-child(#{x}) .product-list__product-image--grid")).perform
      @driver.find_element(:css, ".product-list__product--grid:nth-child(#{x}) .common-button--button").click
      @indigo.add_to_cart_popup.click
      close_side_disp
      sleep(1)
    end
  end

  def goto_cart
    @indigo.shopping_cart
  end

  def pickup # Method holding store-pickup selection logic
    @indigo.pickup_in_store.click
    @indigo.find_store.click
    @indigo.find_store.send_keys("Toronto")
    sleep(1)
    @indigo.find_store.send_keys :enter
    @indigo.select_store.click
  end

  def checkout # Method for completing the checkout process
    @indigo.proceed_to_checkout.click
    @indigo.checkout_continue_button.click
    @indigo.paypal_radio_button.click
  end

end

