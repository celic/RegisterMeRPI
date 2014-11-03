require 'watir'

# Gather parameters
RIN = ARGV[0]
PASSWORD = ARGV[1]
CRNS = ARGV[2..-1]

# Launch FireFox and navigate to login page
browser = Watir::Browser.new :firefox
browser.goto 'https://sis.rpi.edu/rss/twbkwbis.P_WWWLogin'

# Sign in with parameters
browser.text_field(id: 'UserID').set RIN
browser.text_field(name: 'PIN').set PASSWORD
browser.button(value: 'Login').click

# Navigate to register page
