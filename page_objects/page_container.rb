require_relative "../spec/helper"

class HomePage
	def initialize(browser)
		@browser = browser
	end

	def goto_navigator
		@browser.goto('https://www.navigator.ba/#/categories')
	end

	def create_place
		return CreatePlace.new(@browser)
	end

	def suggest_features
		return SuggestFeatures.new(@browser)
	end

	def search_place
		return SearchPlace.new(@browser)
	end
	
end