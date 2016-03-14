# PhishMe 

Automation project for Google search results testing

## Dependencies
To run this you will need an OSX machine with Chrome and Firefox installed.

In addition the below is also required:

* [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) (copy downloaded Chromedriver executable to /usr/bin)
* [Bundler](http://bundler.io/#getting-started) (gem install bundler)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Installation
To install, run the following: 

```irb
$ git clone https://github.com/kchavarria86/PhishMe.git
$ cd PhishMe/
$ bundle install
$ cp config.example config.json
```

## Usage
To run Google search RSpec tests, run the following:

```irb
$ bundle exec rspec TechChallenge.rb
```

## Configuration:
Test options can be set by manually editing the [config.json file](https://github.com/kchavarria86/PhishMe/blob/master/config.example).

Options are as follows:
* "test_url": "http://www.google.com", - Set test URL (ex: google.com, google.mx, google.co.uk)

* "browser": "Chrome", - Set test browser. (ex: Firefox or Chrome)

* "text_input_file": "search_terms.txt" - Set file name of text input file containing search terms


## Files:

	TechChallenge.rb: File that runs RSpec tests

	Search.rb: File for holding the Google search and search result judging methods

	GooglePageObjects.rb: File for holding elements from the Google search page

	TestSetup.rb: File for maintenance tasks that directly support testing (drivers, config files, etc.)

	spec_helper.rb: File for storing and setting config settings in Rspec if needed.

	Gemfile: File for Gem installation via Bundler

	config.example: Example JSON file required for test run

	search_terms.txt: Text file for storing search terms input during testing
