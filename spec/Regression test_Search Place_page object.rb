require 'helper'

describe "Search place" do
  let(:search_place) { @main.search_place }

  context "Search place or object" do
    it "clicks Home button" do
      search_place.click_home_button
    end

    it "enters a place to search"  do
      search_place.search_place "Hotel Bristol"
    end

    it "clicks on enter" do
      search_place.click_enter
    end

    it "checks searched place is found" do
      search_place.check_name_of_searched_place? "Hotel Bristol"
      search_place.check_address_of_searched_place? "Fra Filipa Lastrića 2"
    end

    it "checks icon on the map" do
      search_place.check_place_found?     
    end
  end

  context "Open gallery of searched place" do
    it "clicks on the card of the searched place" do
      search_place.open_card_of_searched_place
    end

    it "opens gallery of searched place" do
      search_place.open_gallery_of_searched_place
    end

    it "clicks next image button in gallery" do
      search_place.click_gallery_next_button
      sleep 4
    end

    it "clicks previous image button in gallery" do
      search_place.click_gallery_previous_button
      sleep 4
    end

    it "clicks exit button in gallery" do
      search_place.click_gallery_exit_button
      sleep 3
    end
  end

  context "User can rate found location" do
    it "rates found object/location" do
      search_place.rate_found_place "5"
      sleep 4
    end
    
    it "checks if location is rated" do
      before=@browser.span(class: "nmb-votes").text.split(" ")
      expect(before[0]).to eq ("16")
    end
  end

  context "User is allowed to claim for selected place, if user is an owner" do
    it "clicks Home button" do
      search_place.click_home_button
    end

    it "enters a place to search"  do
      search_place.search_place "Hostel ACC"
    end

    it "clicks on enter" do
      search_place.click_enter
    end

    it "clicks on the card of the searched place" do
      search_place.open_card_of_searched_place
    end

    it "clicks on 'Vas objekat' button" do
      search_place.click_claim_button
    end

    it "adds name in 'Vas objekat' form" do
      search_place.add_claim_name "Sanela"
    end

    it "adds email in 'Vas objekat' form" do
      search_place.add_claim_email "sane_mesic@hotmail.com"
    end

    it "adds phone in 'Vas objekat' form" do
      search_place.add_claim_phone "062163249"
    end

    it "clicks on 'Posalji' button" do
      search_place.click_claim_send_button
    end
  end
end