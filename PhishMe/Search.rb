#!/usr/bin/ruby
#
# Karl G Chavarria
# 02/06/2016
#
# Search.rb: This class contains methods for running a Google Search and then logically iterating through the results
#

require_relative 'spec_helper'

class Search

  def initialize(driver)
    @driver = driver
    @wiki_included = false
    @google = GooglePageObjects.new(@driver)
  end
  
  def includes_wiki_results # Method for returning whether expected Wikipedia results are found
    if @wiki_included
      true
    else
      false
    end
  end

  def results_comb(link, index, search_term, results_term) # Method holding results judging logic
    if link.text.to_s.downcase.include? results_term.downcase # if result includes Wikipedia string proceed to next if

      # Using nested if, instead of if (x)||(y) to avoid absurdly long line of code
      if link.text.to_s.downcase.include? search_term.downcase
        @wiki_included = true # Set @wiki_included to true if result also includes search term string
      else
        if @google.result_descriptions.at(index).text.to_s.downcase.include? search_term.downcase
          @wiki_included = true # Set @wiki_included to true if description text includes search term string
        end
      end

    end
  end

  def run_search(search_term, results_term) # Method for running the actual Google search
    @google.search_box.send_keys(search_term)
    @google.search_box.submit

    @google.result_titles.each_with_index do |link, index| # Iterate through the search results looking for a Wikipedia result
      results_comb(link, index, search_term, results_term)
    end
  end


end

