require 'rails_helper'

feature 'submit cat' do
  scenario 'user submits valid cat' do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

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
