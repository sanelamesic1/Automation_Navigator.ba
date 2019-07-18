require 'rspec'
require 'watir'
require 'spec_helper'
require "selenium-webdriver"


describe "Redirection buttons_Regression test" do

	before(:all) do
    	@browser = Watir::Browser.new :chrome
    	@browser.goto('https://www.navigator.ba/#/categories')
  end

	context "Redirecting to Facebook page by clicking on the icon" do
		it "clicks on Facebook icon" do
			@browser.span(class: "iconav-facebook").click
			#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
			#wait.until do
		end

		it "checks if user is redirected to website" do
  		
  
  	  #current_path.should = 'https://www.facebook.com/Navigator.ba/'
			#@browser.url.should include('?preview=true')
  	  
  	  #expect(@browser.url).to include('?preview=true')
  	  #@browser.url.should == "https://www.facebook.com/Navigator.ba/"   #vraca navigator.ba
  	  #expect(page).to have_current_path('https://www.facebook.com/Navigator.ba/')
  	  #@browser.windows.last.use 
  	  #expect(@browser.current_path).to eql? ('https://www.facebook.com/Navigator.ba/')
  	 	@browser.windows.last.use do
  	 		expect(@browser.url).eql? ("https://www.facebook.com/Navigator.ba") 
  	 	end

  	 	#page.within_window new_window.url =="https://www.facebook.com/Navigator.ba/" 

  	 	#Watir::Wait.until { @browser.current_path == "https://www.facebook.com/Navigator.ba/" }
		end

	end

	

	context "Redirecting to Twitter page by clicking on the icon" do
		it "clicks on Twitter icon" do
			sleep 5
		end

		it "checks if user is redirected to the right website" do
			@browser.windows.last.use do
  	 		expect(@browser.url).eql? ("https://twitter.com/navigatorba") 
  	 	end
  	end
  end


	context "Redirecting to Google+ page by clicking on the icon" do
		it "clicks on Google+ icon" do
			@browser.span(class: "iconav-googleplus").click
			sleep 5
		end

		it "checks if user is redirected to the right website" do
			@browser.windows.last.use do
  	 		expect(@browser.url).eql? ("https://plus.google.com/108400709887587279208") 
  	 	end
  	end
	end

	context "Redirecting to 'Home' page" do
  	it "enters a place to search"  do
    	@browser.text_field(placeholder: "Traži ulicu ili objekat").set("Gradska vijećnica")
  	end

		it"clicks on enter" do
    	@browser.send_keys :enter
   	end

		it "clicks on 'Home' button" do
		sleep 3
		end

		it "checks if user is redirected to the right website" do
			@browser.windows.last.use do
  	 		expect(@browser.url).eql? ("http://www.navigator.ba/#/categories") 
  	 	end
  	end
	end

end
