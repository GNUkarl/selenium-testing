#!/usr/bin/ruby
#
# Karl G Chavarria
# 10/20/2014
#
# Usage: Prints a basic usage statement if there's no login.txt present

class Usage

	def initialize()

	end

	def show()
		print "\nThis scripte requires a login.txt file in the same directory!\n\n"
		print "The login.txt file must stick to the following format:\n\n"
		print "email: userid@site.com\n"
		print "password: your_password_here\n\n"
		exit
	end

end
