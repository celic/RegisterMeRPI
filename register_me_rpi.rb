require 'watir'

browser = Watir::Browser.new :firefox
browser.goto 'https://sis.rpi.edu/rss/twbkwbis.P_WWWLogin'

browser.text_field(id: 'UserID').set '661124371'
browser.text_field(name: 'PIN').set 'PASSWORD'

browser.button(value: 'Login').click