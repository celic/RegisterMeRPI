require 'watir'

# Gather parameters
RIN = ARGV[0]
PASSWORD = ARGV[1]
CRNS = ARGV[2..-1]
REGISTER_TIME = Time.new(2014, 11, 06, 09, 30, 05, '-05:00')

# Wait til registration time
while Time.now < REGISTER_TIME
	
	# Let's not kill our processor...
	sleep(60.seconds)
end

# Launch FireFox and navigate to login page
browser = Watir::Browser.new :firefox
browser.goto 'https://sis.rpi.edu/rss/twbkwbis.P_WWWLogin'

# Sign in with parameters
browser.text_field(id: 'UserID').set RIN
browser.text_field(name: 'PIN').set PASSWORD
browser.button(value: 'Login').click 

# Navigate to register page
browser.goto 'https://sis.rpi.edu/rss/bwskfreg.P_AltPin'

# Click submit
browser.button(value: 'Submit').click

# Fill in CRNs
CRNS.each_with_index do |crn, index|
	
	browser.text_field(id: "crn_id#{index + 1}").set crn
end

# Click submit
browser.button(value: 'Submit Changes').click
