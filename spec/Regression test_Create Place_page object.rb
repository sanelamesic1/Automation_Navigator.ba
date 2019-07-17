require 'helper'

describe "Create Place_Regression test" do

	let(:create_place) { @main.create_place }
	
	working_days=["mon", "tue", "wed", "thu", "fri"]
	
	context "Create place" do
    it "clicks on the button 'Kreiraj objekat'"  do
     	create_place.click_create_place_button 
    end

    it "adds name for the object" do
      create_place.add_name "Hostel ACC"
    end
      
    it "adds name of the city" do  
      create_place.add_city "Sarajevo"
    end

    it "adds zip code for the object" do
      create_place.add_zip_code "71000"
    end
      
    it "adds name of the street for the object" do
      create_place.add_street "Zmaja od Bosne"
    end

    it "adds house number for the object" do
      create_place.add_house_number "1"
    end

    it "adds alternative address" do
      create_place.add_alternative_address "Hamdije Cemerlica"
    end

    it "adds description for the object" do
      create_place.add_description "Apartmani HCC nude najbolju uslugu svim svojim gostima !"
    end

    it "adds new category" do
      create_place.click_category_button  
    end

    it "selects new category" do
      create_place.click_select_list 
      create_place.add_new_category "3" 
    end

    it "inserts working hours" do
      create_place.add_working_hours "8", "23"
    end

    it "clicks button add" do
      create_place.click_add_working_hour_button
    end

    it "adds phone number" do
      create_place.add_phone_number "032123456"
    end

    it "adds mobile phone number" do
      create_place.add_mobile_phone "062163249"
    end

    it "adds email address" do 
      create_place.add_email "sane_mesic@hotmail.com"
    end

    it "adds instagram hashtag" do 
      create_place.add_instagram_hashtag "#HCC"
    end

    it "checks WI-FI button option" do
      create_place.check_wifi_option
    end

    it "adds WI-FI password" do
      create_place.add_password "12345678"
    end

    it "adds WI-FI network name" do
      create_place.add_network_name "HCC Apartmani"
    end

    it "checks Accepts Cards option " do
      create_place.click_accepts_card_button
    end

    it "clicks button for adding image" do
      create_place.add_image_button "/home/sanela/Desktop/Automation_Navigator.ba/spec/apartmani.jpeg"
    end
  
    it "adds comment" do
      create_place.add_comment "Odlicno!"
    end

    it "clicks on the button 'Kreiraj'" do
      create_place.click_kreiraj_button
    end

    it "checks if new place or an object is created" do
      create_place.check_name_of_new_object? "Hostel ACC"
    end

    it "checks if new category is added" do
      create_place.check_category_of_new_object? "Smještaj"
    end
    it "checks icon on the map" do
      create_place.check_new_place_created?
    end
  end

  context "Cancel Create place form" do
    it "clicks Home button" do
      create_place.click_home_button
    end

    it "clicks on the button 'Kreiraj objekat'"  do
      create_place.click_create_place_button 
    end

    it "clicks on the button 'Odustani'" do
      create_place.click_odustani_button
    end

    it "checks if form is successfully closed" do
      create_place.form_closed? "https://www.navigator.ba/#/categories"
    end
  end

  context "Leave all fields empty when 'Create Place'" do
    it "clicks on the button 'Kreiraj objekat'"  do
      create_place.click_create_place_button 
    end

    it "clicks on the button 'Kreiraj'" do
      create_place.click_kreiraj_button
    end

    it "checks if error message appears" do
      create_place.check_error_message? "Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo"
    end
  end

  context "Insert invalid format for e-mail address when 'Create place'" do
    it "clicks Home button" do
      create_place.click_home_button
    end

    it "clicks on the button 'Kreiraj objekat'"  do
      create_place.click_create_place_button 
    end

    it "adds name for the object" do
      create_place.add_name "Hostel ACC"
    end

    it "adds new category" do
      create_place.click_category_button  
    end

    it "selects new category" do
      create_place.click_select_list 
      create_place.add_new_category "3" 
    end

    it "adds invalid email address" do 
      create_place.add_email "aaa"
    end

    it "clicks on the button 'Kreiraj'" do
      create_place.click_kreiraj_button
    end

    it "checks if error message appears" do
      create_place.check_error_message? "Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo"        
    end  
  end

  context "Insert invalid data: city, address, zip code, city when 'Create place'" do
    it "clicks Home button" do
      create_place.click_home_button
    end

    it "clicks on the button 'Kreiraj objekat'"  do
      create_place.click_create_place_button 
    end

    it "adds name for the object" do
      create_place.add_name "Hostel ACC"
    end

    it "adds name of the city" do  
      create_place.add_city "aa"
    end

    it "adds zip code for the object" do
      create_place.add_zip_code "aa"
    end
      
    it "adds name of the street for the object" do
      create_place.add_street "asd"
    end

    it "adds house number for the object" do
      create_place.add_house_number "a"
    end

    it "adds new category" do
      create_place.click_category_button  
    end

    it "selects new category" do
      create_place.click_select_list 
      create_place.add_new_category "3" 
    end

    it "adds mobile phone number" do
      create_place.add_mobile_phone "aaaa"
    end
    
    it "clicks on the button 'Kreiraj'" do
      create_place.click_kreiraj_button
    end

    it "checks if error message appears" do
      create_place.check_error_message? "Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo"
    end
  end

  context "User should not be able to click create button unless all of the required fields are filled" do
    it "clicks Home button" do
      create_place.click_home_button
    end

    it "clicks on the button 'Kreiraj objekat'"  do
      create_place.click_create_place_button 
    end

    it "adds name of the city" do  
      create_place.add_city "Sarajevo"
    end

    it "adds zip code for the object" do
      create_place.add_zip_code "71000"
    end
      
    it "adds name of the street for the object" do
      create_place.add_street "Zmaja od Bosne"
    end

    it "adds house number for the object" do
      create_place.add_house_number "1"
    end

    it "adds alternative address" do
      create_place.add_alternative_address "Hamdije Cemerlica"
    end

    it "adds description for the object" do
      create_place.add_description "Apartmani HCC nude najbolju uslugu svim svojim gostima !"
    end

    it "inserts working hours" do
      create_place.add_working_hours "8", "23"
    end

    it "clicks button add" do
      create_place.click_add_working_hour_button
    end

    it "adds phone number" do
      create_place.add_phone_number "032123456"
    end

    it "adds mobile phone number" do
      create_place.add_mobile_phone "062163249"
    end

    it "adds email address" do 
      create_place.add_email "sane_mesic@hotmail.com"
    end

    it "adds instagram hashtag" do 
      create_place.add_instagram_hashtag "#HCC"
    end

    it "checks WI-FI button option" do
      create_place.check_wifi_option
    end

    it "adds WI-FI password" do
      create_place.add_password "12345678"
    end

    it "adds WI-FI network name" do
      create_place.add_network_name "HCC Apartmani"
    end

    it "checks Accepts Cards option " do
      create_place.click_accepts_card_button
    end

    it "clicks on the button 'Kreiraj'" do
      create_place.click_kreiraj_button
    end

    it "checks if error message appears" do
      create_place.check_error_message? "Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo"
    end
  end
end