require 'helper'

describe "Search place" do
  let(:search_place) { @main.search_place }

  context "Redirecting to Facebook page by clicking on the icon" do
    it "clicks on Facebook icon" do
      search_place.click_facebook_icon
    end
    it "checks if user is redirected to the website" do
      @browser.windows.last.use do
        expect(@browser.url).eql? ("https://www.facebook.com/Navigator.ba")
      end
    end
  end
  context "Redirecting to Twitter page by clicking on the icon" do
    it "clicks on Twitter icon" do
      search_place.click_twitter_icon
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
      search_place.click_google_plus_icon
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
      search_place.search_place "Hotel Bristol"
    end

    it"clicks on enter" do
      search_place.click_enter
    end

    it "clicks on 'Home' button" do
      search_place.click_home_button
      sleep 3
    end

    it "checks if user is redirected to the right website" do
      @browser.windows.last.use do
        expect(@browser.url).eql? ("http://www.navigator.ba/#/categories")
      end
    end
  end
end