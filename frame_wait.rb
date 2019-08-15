require 'webdrivers'
require 'watir'

@browser = Watir::Browser.new :chrome
hook     = proc { @heading_found = @browser.h1(id: 'page_title').present? }
@browser.after_hooks.add hook

# Navigate to test page
@browser.goto File.join('file://', File.expand_path('frame_test.html'))

# IFrame should be present
puts "IFrame found: #{@browser.iframe(id: 'watir').present?}"

# Look for Div inside iframe
puts "Div text: #{@browser.iframe(id: 'watir').div(class: 'intro').text}"

# Check for presence of heading element outside the iframe.
puts "Heading found: #{@heading_found}"

@browser.close