#!/usr/bin/ruby
#
# Karl G Chavarria
# 04/09/2022
#
# IndigoPageObjects.rb: This class includes elements from the purchase flow pages that have been converted into methods
# for future use by other classes.
#

require_relative 'spec_helper'

class IndigoPageObjects

  def initialize(driver)
    @driver = driver
    end

  def start_sign_in
    @driver.find_element(:css, ".service-link:nth-child(2)")
  end

  def email_field
    @driver.find_element(:css, "#browseCart-signInPopup-emailTextbox")
  end

  def password_field
    @driver.find_element(:css, "#browseCart-signInPopup-passwordTextbox")
  end

  def sign_in_button
    @driver.find_element(:css, ".js-clickSignIn-button")
  end

  def signed_in
    @driver.find_elements(:class, "signed-in")
  end

  def search_bar
    @driver.find_element(:css, "#header__quick-search")
  end

  def first_product
    @driver.find_element(:css, ".product-list__product:nth-child(1) .product-list__product-title > .product-list__product-title")
  end

  def add_to_cart
    @driver.find_element(:css, ".add-to-cart-button__button > .common-button")
  end

  def add_to_cart_popup
    @driver.find_element(:css, ".add-to-cart-button__primary")
  end

  def side_disp_x
    @driver.find_element(:class, "cart-state-notification__close-button")
  end

  def new_items
    @driver.navigate.to("https://www.chapters.indigo.ca/en-ca/new-arrivals/?link-usage=Header%3A%20New&mc=NewArrivals&lu=Main")
  end

  def shopping_cart
    @driver.navigate.to("https://www.chapters.indigo.ca/en-ca/checkout/shoppingbag.html")
  end

  def pickup_in_store
    @driver.find_element(:id, "pickup-radio-button")
  end

  def find_store
    @driver.find_element(:id, "find-in-store-search__typeahead")
  end

  def select_store
    @driver.find_element(:css, ".store-286 > .common-button--ghost")
  end

  def proceed_to_checkout
    @driver.find_element(:id, "cart-checkout-button")
  end

  def checkout_continue_button
    @driver.find_element(:class, "continue-button")
  end

  def paypal_radio_button
    @driver.find_element(:id, "third-party-payment-row-btn-payPal")
  end

  def continue_to_paypal
    @driver.find_elements(:css, ".third-party-payment-row__active-message")
  end

end