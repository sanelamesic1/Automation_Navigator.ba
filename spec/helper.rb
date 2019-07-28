require 'rspec'
require 'watir'
require 'require_all'

begin
	require_all "./page_objects/"
rescue
  puts "no object found"
end

RSpec.configure do |config|
  config.before (:all) {
    @browser = Watir::Browser.new :chrome
    @main = HomePage.new(@browser)
    @main.goto_navigator
  }
  config.after(:all) {@browser.close}
end

