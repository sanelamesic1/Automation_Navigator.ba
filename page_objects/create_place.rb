require_relative "../spec/helper"

class CreatePlace < HomePage

  def create_button
    @browser.link(href: '#/create-place')
  end
  def name_field
    @browser.text_field(id: "poi_name")
  end
  def city_field
    @browser.text_field(id: "poi_city_name")
  end
  def zip_code_field
    @browser.text_field(id: "poi_zip_code")
  end
  def street_field
    @browser.text_field(id: "poi_place_id")
  end
  def house_number_field
    @browser.text_field(id: "poi_house_number")
  end
  def alternative_street_field
    @browser.text_field(id: "poi_street_name_alt")
  end
  def description_field
    @browser.textarea(id: "poi_description")
  end
  def category_button
    @browser.button(title: "Odaberite kategoriju")
  end
  def select_list
    @browser.element(xpath: ".//div[contains(@class, 'span3')]/select")
  end
  def working_hour_open_field
    @browser.text_field(id: "working_hours_0_0")
  end
  def working_hour_close_field
    @browser.text_field(id: "working_hours_0_1")
  end
  def add_working_hour_button
    @browser.button(class: ["btn", "btnAddWorkingHours"])
  end
  def phone_field
    @browser.text_field(id: "poi_phone")
  end
  def mobile_phone_field
    @browser.text_field(id: "poi_mobile_phone")
  end
  def email_field
    @browser.text_field(id: "poi_email")
  end
  def instagram_hashtag_field
    @browser.text_field(id: "poi_instagram_hashtag")
  end
  def wifi_option
    @browser.input(id: "poi_has_wifi")
  end
  def wifi_password_field
    @browser.text_field(id: "poi_wifi_pass")
  end
  def wifi_network_name
    @browser.text_field(id: "poi_wifi_ssid")
  end
  def accepts_cards
    @browser.input(id: "poi_accepts_credit_cards")
  end
  def image_button
    @browser.file_field(id: "fileToUpload")
  end
  def comment_field
    @browser.textarea(id: "poi_comment")
  end
  def kreiraj_button
    @browser.button(class: ["btn", "btn-success"])
  end
  def name_of_new_object
    @browser.div(class: 'name')
  end
  def category_of_new_object 
    @browser.div(class: 'categories')
  end
  def home_button 
    @browser.a(href: "#/categories")
  end
  def odustani_button
    @browser.button(class: ["btn", "cancel"])
  end
  def error_message
    @browser.div(class: ["row", "validation-error-msg"])
  end
  def icon_on_map
    @browser.span(class: "inner-icon")
  end

  #actions

  def click_create_place_button
    create_button.click
  end
  def add_name(name)
    name_field.set name
  end
  def add_city (city)
    city_field.set city
  end
  def add_zip_code (zip_code)
    zip_code_field.set zip_code
  end
  def add_street (street)
    street_field.set street
  end
  def add_house_number (house_number)
    house_number_field.set house_number
  end
  def add_alternative_address (alternative_street)
    alternative_street_field.set alternative_street
  end
  def add_description (description)
    description_field.set description
  end
  def click_category_button
    category_button.click
  end
  def click_select_list
    select_list.click
  end
  def add_new_category (category)
    @browser.option(value:"#{category}").click
  end
  def add_working_hours (open, close)
    @browser.execute_script("arguments[0].value='#{open}';", working_hour_open_field, visible: false)
    @browser.execute_script("arguments[0].value='#{close}';", working_hour_close_field, visible: false)
  end
  def click_add_working_hour_button
    @browser.execute_script("arguments[0].click();",add_working_hour_button, visible: false)
  end
  def add_phone_number (phonenumber)
    @browser.execute_script("arguments[0].value='#{phonenumber}';", phone_field, visible: false)
  end
  def add_mobile_phone (mobilephone)
    @browser.execute_script("arguments[0].value='#{mobilephone}';", mobile_phone_field, visible: false)
    sleep 2
  end
  def add_email (email)
    @browser.execute_script("arguments[0].value='#{email}';", email_field, visible: false)
  end
  def add_instagram_hashtag (hashtag)
    @browser.execute_script("arguments[0].value='#{hashtag}';", instagram_hashtag_field, visible: false)
  end
  def check_wifi_option
    @browser.execute_script("arguments[0].click();",wifi_option, visible: false)
  end
  def add_password (password)
    @browser.execute_script("arguments[0].value='#{password}';", wifi_password_field, visible: false)
  end
  def add_network_name (wifi_name)
    @browser.execute_script("arguments[0].value='#{wifi_name}';", wifi_network_name, visible: false)
  end
  def click_accepts_card_button
    @browser.execute_script("arguments[0].click();",accepts_cards, visible: false)
  end
  def add_image_button (image)
    @browser.execute_script("arguments[0].focus();",image_button)
    image_button.set image
    sleep 10
  end
  def add_comment (comment)
    @browser.execute_script("arguments[0].value='#{comment}';", comment_field, visible: false)
  end
  def click_kreiraj_button
    @browser.execute_script("arguments[0].click();",kreiraj_button, visible: false)
    sleep 3
  end
  def check_name_of_new_object? (object)
    name_of_new_object.exists?
    name_of_new_object.eql?("#{object}")
  end
  def check_category_of_new_object? (new_category)
    category_of_new_object.exists?
    category_of_new_object.text.eql?("#{new_category}")
  end
  def click_home_button
    home_button.click
  end
  def click_odustani_button
    @browser.execute_script("arguments[0].click();",odustani_button, visible: false)
  end
  def form_closed? (browser_url)
    @browser.url.eql?("#{browser_url}")
  end
  def check_error_message? (error_message_text)
    error_message.exists?
    error_message.text.eql?("#{error_message_text}")
  end
  def check_new_place_created?
    icon_on_map.exists?
  end
end	