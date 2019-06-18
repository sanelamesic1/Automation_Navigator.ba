require 'rspec'
require 'watir'

describe "Smoke test" do

  before(:all) do
    @browser = Watir::Browser.new :chrome
    @browser.goto('https://www.navigator.ba/#/categories')
  end

  context "Search place" do
    it "enters a place to search"  do
      @browser.text_field(placeholder: "Traži ulicu ili objekat").set("Gradska vijećnica")
    end

    it "clicks on enter" do
      @browser.send_keys :enter
    end

    it "checks searched place is found" do
      expect(@browser.div(class: 'name')).to exist
      expect(@browser.div(class: 'name').text).to eql("Gradska vijećnica")
      expect(@browser.div(class: 'address')).to exist
      expect(@browser.div(class: 'address').text).to eql("Obala Kulina bana, Sarajevo")
    end

    it "checks icon on the map" do
      expect(@browser.span(class: "inner-icon"))      
    end
  end

  context "Create place" do
    it "clicks on the button 'Kreiraj objekat'"  do
      @browser.link(href: '#/create-place').click  
    end

    it "adds name for the object" do
      @browser.text_field(id: "poi_name").set("Apartmani HCC")
    end
      
    it "adds name of the city" do  
      @browser.text_field(id: "poi_city_name").set ("Sarajevo")
    end

    it "adds zip code for the object" do
      @browser.text_field(id: "poi_zip_code").set("71000")
    end
      
    it "adds name of the street for the object" do
      @browser.text_field(id: "poi_place_id").set("Hamdije Čemerlića")
    end

    it "adds house number for the object" do
      @browser.text_field(id: "poi_house_number").set("1")
    end

    it "adds description for the object" do
      @browser.textarea(id: "poi_description").set("Apartmani HCC nude najbolju uslugu svim svojim gostima !")
    end

    it "adds new category" do
      @browser.button(title: "Odaberite kategoriju").click
    end
      
    it "selects new category" do
      @browser.element(xpath: ".//div[contains(@class, 'span3')]/select").click
      @browser.option(value: "3").click
    end
        
    it "clicks on the button 'Kreiraj'" do
      @browser.button(class: ["btn", "btn-success"]).click!
      sleep 3
    end

    it "checks if new place or an object is created" do
      expect(@browser.div(class: 'name')).to exist
      expect(@browser.div(class: 'name').text).eql?("Apartmani HCC")
      expect(@browser.div(class: 'categories')).to exist
      expect(@browser.div(class: 'categories').text).eql?("Smještaj")
    end

    it "checks icon on the map" do
      expect(@browser.span(class: "inner-icon"))      
    end
  end

  context "Suggest features - Report a problem" do
    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      @browser.link(href: '#/feedback').click
    end

    it "adds name and surname" do
      @browser.text_field(name: "name_surname").set("Sanela Mesic")
    end

    it "adds an e-mail address" do
      @browser.text_field(placeholder: "Email").set("sane_mesic@hotmail.com")
    end

    it "adds a comment" do
      @browser.textarea(name: "comment").set("Sve pohvale!")
    end

    it "selects one of the options : 'Pohvala' or 'Kritika'" do
      @browser.label(class: "green").radio.set
    end

    it "clicks on the button 'Pošalji'" do
      @browser.button(class: ["btn", "green-button"]).click 
      sleep 3
    end

    it "checks if message is successfully sent" do
      expect(@browser.div(class: ["alert", "alert-success"])).to exist
      expect(@browser.div(class: ["alert", "alert-success"]).text).eql?("Hvala na poruci! Potrudit ćemo se da što prije reagujemo.")
    end
  end
end
