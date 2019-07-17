require_relative "../spec/helper"

class SearchPlace < HomePage
	def home_button 
    @browser.a(href: "#/categories")
  end
	def search_place_field
		@browser.text_field(placeholder: "Traži ulicu ili objekat")
	end
	def name_of_searched_place 
		#@browser.li(class: "attractions").div(class: "name")
		@browser.ul(class: ["menu_content_list" "search-results"]).div(class: "name")
	end
	def address_of_searched_place
		#@browser.li(class: "attractions").div(class: "address")
		@browser.ul(class: ["menu_content_list" "search-results"]).div(class: "address")
	end
	def icon_on_map
    @browser.span(class: "inner-icon")
  end

  def searched_place_card
  	@browser.li(class: ["ember-view", "place"])
  end
  def gallery_image
  	@browser.div(class: ["ember-view profile-image-container", "common-shadow"])
  end
  def gallery_next_button
  	@browser.button(id: "cboxNext")
  end
  def gallery_previous_button
  	@browser.button(id: "cboxPrevious")
  end
  def gallery_exit_button
  	@browser.button(id: "cboxClose")
  end
  def rate_stars
  	@browser.div(title: "Ocijeni").div(class: "empty")
  end
  def previous_star_number
  	@browser.span(class: "nmb-votes").text.split(" ")
  end
  def claim_button
  	@browser.div(class: "buttons").button(class: ["btn", "btn-claim"])
  end
  def claim_form_name
  	@browser.text_field(placeholde: "Vaše ime")
  end
  def claim_form_email
  	@browser.text_field(placeholder: "Vaš email")
  end
  def claim_form_phone
  	@browser.text_field(placeholder: "Vaš telefon")
  end
  def claim_form_send_button
  	@browser.button(class: ["btn", "btn-success"])
  end


#actions

	def click_home_button
		home_button.click
	end
	def search_place (searchedplace)
		search_place_field.set searchedplace
	end
	def click_enter
		@browser.send_keys :enter
	end
	def check_name_of_searched_place? (nameofplace)
  	name_of_searched_place.exists?
  	name_of_searched_place.eql?("#{nameofplace}")
  end
  def check_address_of_searched_place? (addressofplace)
  	address_of_searched_place.exists?
  	address_of_searched_place.eql?("#{addressofplace}")
  end
  def check_place_found? 
    icon_on_map.exists?
  end
  def open_card_of_searched_place
  	searched_place_card.click
  end
  def open_gallery_of_searched_place
  	gallery_image.click
  end
  def click_gallery_next_button
  	gallery_next_button.click
  end
  def click_gallery_previous_button
  	gallery_previous_button.click
  end
  def click_gallery_exit_button
  	gallery_exit_button.click
  end
  def rate_found_place (star)
  	rate_stars.span(data_value: "#{star}").onclick
  end
  def click_claim_button
  	@browser.execute_script("arguments[0].click();",claim_button, visible: false)
  end
  def add_claim_name (claimname)
  	claim_form_name.set claimname
  end
  def add_claim_email (claimemail)
  	claim_form_email.set claimemail
  end
  def add_claim_phone (claimphone)
  	claim_form_phone.set claimphone
  end
  def click_claim_send_button
  	claim_form_send_button.click
  end


  









end