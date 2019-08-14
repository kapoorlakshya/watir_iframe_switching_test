require 'webdrivers'
require 'watir'

@browser = Watir::Browser.new :chrome
hook     = proc { puts "Heading found: #{@browser.h1(id: 'page_title').present?}" }
@browser.after_hooks.add { hook }

# Navigate to test page
@browser.goto File.join('file://', File.expand_path('frame_test.html'))

# IFrame should be present
puts "IFrame found: #{@browser.iframe(id: 'watir').present?}"

# Look for Div inside iframe
puts @browser.iframe(id: 'watir').div(class: 'intro').text

@browser.close