#!/usr/bin/ruby
#
# Karl G Chavarria
# 10/20/2014
#
# ConfigFile: Class made to look for a login.txt file and import username/password values from it
# This class takes one argument, watched_file, which is the filename to import from the running directory
# TODO: Add actual config file regex verification to ensure a valid file

require_relative "Usage"

class ConfigFile

	def initialize(wanted_file)
		@wanted_file=wanted_file
	end

	def checkexist() # Checks whether or not the desired config file exists

		show_usage=Usage.new()

		unless File.exist?(@wanted_file) #if file doesn't exist show usage statement
			show_usage.show
			exit
		end

	end

	def email() # Reads the config file and prints the actual email address
		lines = IO.readlines(@wanted_file)
		first = lines.first
		match = first[/email: (.*)/, 1]
	end

	def pass() # Reads the config file and prints the actual password
                lines = IO.readlines(@wanted_file)
                first = lines.last
                match = first[/password: (.*)/, 1]
	end

end
