require 'helper'

describe "Suggest features&Report a problem_Regression test" do

  let(:suggest_features) { @main.suggest_features }

  context "Fill in all text field in Suggest features form with valid data" do
    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      suggest_features.click_suggest_features_button
    end

    it "adds name and surname" do
      suggest_features.add_name "Sanela Mesic"
    end

    it "adds an e-mail address" do
      suggest_features.add_email "sane_mesic@hotmail.com"
    end

    it "adds a comment" do
      suggest_features.add_comment "Sve pohvale!"
    end

    it "selects one of the options : 'Pohvala' or 'Kritika'" do
      suggest_features.click_pohvala_button
    end

    it "clicks on the button 'Pošalji'" do
      suggest_features.click_posalji_button
    end
    
    it "checks if message is successfully sent" do
      suggest_features.check_suggest_send? "Hvala na poruci! Potrudit ćemo se da što prije reagujemo."
    end
  end


  context "Insert invalid form of email address in form" do
    it "clicks Home button" do
      suggest_features.click_home_button
    end

    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      suggest_features.click_suggest_features_button
    end

    it "adds name and surname" do
      suggest_features.add_name "Sanela Mesic"
    end

    it "adds an e-mail address" do
      suggest_features.add_email "aaa"
    end

    it "adds a comment" do
      suggest_features.add_comment "Sve pohvale!"
    end

    it "selects one of the options : 'Pohvala' or 'Kritika'" do
      suggest_features.click_kritika_button
    end

    it "clicks on the button 'Pošalji'" do
      suggest_features.click_posalji_button
    end

    it "checks if message is not successfully sent" do
      suggest_features.check_suggest_not_send?
    end
  end

  context "Leave all fields empty when Suggest Features " do
    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      suggest_features.click_suggest_features_button
    end

    it "clicks on the button 'Pošalji'" do
      suggest_features.click_posalji_button
    end

    it "checks if message is not successfully sent" do
      suggest_features.check_suggest_not_send?
    end
  end

  context "User should not be able to click 'Pošalji' button unless required field 'Komentar' is filled" do
    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      suggest_features.click_suggest_features_button
    end

    it "adds name and surname" do
      suggest_features.add_name "Sanela Mesic"
    end

    it "adds an e-mail address" do
      suggest_features.add_email "sane_mesic@hotmail.com"
    end

    it "selects one of the options : 'Pohvala' or 'Kritika'" do
      suggest_features.click_kritika_button
    end

    it "clicks on the button 'Pošalji'" do
      suggest_features.click_posalji_button
    end

    it "checks if message is not successfully sent" do
      suggest_features.check_suggest_not_send?
    end
  end

  context "Cancel Suggest Features form" do
    it "clicks on the button 'Predloži ideju - Pošalji komentar'" do
      suggest_features.click_suggest_features_button
    end

    it "clicks on the button 'Odustani'" do
      suggest_features.click_odustani_button
    end

    it "checks if form is successfully closed" do 
      suggest_features.form_closed? "https://www.navigator.ba/#/categories"
    end
  end
end
