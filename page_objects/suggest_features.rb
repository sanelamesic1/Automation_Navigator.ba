require_relative "../spec/helper"

class SuggestFeatures < HomePage

  def suggest_features_button
		@browser.link(href: '#/feedback')
	end
	def name_field
		@browser.text_field(name: "name_surname")
	end
	def email_field
		@browser.text_field(placeholder: "Email")
	end
	def comment_field
    @browser.textarea(name: "comment")
  end
  def pohvala_button
  	@browser.label(class: "green")
	end
	def kritika_button
		@browser.label(class: "red")
	end
	def posalji_button
		@browser.button(class: ["btn", "green-button"])
  end
  def send_message 
  	@browser.div(class: ["alert", "alert-success"])
  end
  def home_button 
    @browser.a(href: "#/categories")
  end
  def odustani_button
  	@browser.button(class: ["btn", "grey-button"])
  end

	#akcije

	def click_suggest_features_button
		suggest_features_button.click
	end
	def add_name (name)
		name_field.set name
	end
	def add_email (email)
		email_field.set email
	end
	def add_comment (comment)
		comment_field.set comment
	end
	def click_pohvala_button
		pohvala_button.radio.set
	end
	def click_kritika_button
		kritika_button.radio.set
	end
	def click_posalji_button
		posalji_button.click
	end
	def check_suggest_send? (sendmessage)
    send_message.exists?
   	send_message.text.eql? ("#{sendmessage}")
  end
  def check_suggest_not_send?
  	send_message.nil?
  end
  def click_home_button
    home_button.click
  end
  def click_odustani_button
  	odustani_button.click
  end
  def form_closed? (browser_url)
    @browser.url.eql?("#{browser_url}")
  end
end
