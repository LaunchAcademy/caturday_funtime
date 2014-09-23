require 'rails_helper'

feature 'registration' do
  scenario 'fill in registration form' do
    visit "/users/sign_up"

    fill_in "Email" , with: "fake@gmail.com"
    fill_in "Password", with: "thisismypassword"
    fill_in "Password confirmation", with: "thisismypassword"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

    visit "/cats/new"

    fill_in "Name", with: "Gangsta Cat"
    fill_in "Url", with: "http://example.com/cat.png"
    fill_in "Description", with: "The fanciest cat I've seen all day."
    click_button "Create Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_css("img[src='http://example.com/cat.png']")

    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
  end
end
