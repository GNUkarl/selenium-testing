# Order

Automation project using the indigo.ca purchase flow

## Dependencies
To run this you will need an OSX or Linux machine with Chrome and Firefox installed.

In addition the below is also required:

* [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) (copy downloaded Chromedriver executable to /usr/bin)
* [Bundler](http://bundler.io/#getting-started) (gem install bundler)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Installation
To install, run the following: 

```irb
$ git clone https://github.com/GNUkarl/Order.git
$ cd Order/
$ bundle install
$ cp config.example config.json
```

## Usage
To run the RSpec tests, run the following:

```irb
$ bundle exec rspec TechChallenge.rb
```

## Configuration:
Test options can be set by manually editing the [config.json file](https://github.com/GNUkarl/Order/blob/master/config.example).


## Files:

	TechChallenge.rb: File that runs RSpec tests

	Purchase.rb: File for holding methods for running through the Indigo purchase flow

	IndigoPageObjects.rb: File for holding abstracted elements from the Indigo purchase flow

	TestSetup.rb: File for maintenance tasks that directly support testing (drivers, config files, etc.)

	spec_helper.rb: File for storing and setting config settings in Rspec if needed.

	Gemfile: File for Gem installation via Bundler

	config.example: Example JSON file required for test run