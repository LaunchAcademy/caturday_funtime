require 'rails_helper'

feature 'guest registration' do
  scenario 'fill in registration form' do
    visit "/users/sign_up"

    fill_in "Email" , with: "fake@gmail.com"
    fill_in "Password", with: "thisismypassword"
    fill_in "Password confirmation", with: "thisismypassword"
    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
