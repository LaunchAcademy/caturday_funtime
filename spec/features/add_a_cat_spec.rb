require 'rails_helper'

feature 'submit cat' do
  scenario 'user submits valid cat' do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

    visit "/cats/new"

    fill_in "Name", with: "Gangsta Cat"
    fill_in "or use an image URL", with: "http://example.com/cat.png"
    fill_in "Description", with: "The fanciest cat I've seen all day."
    fill_in "Tags", with: "gangsta fancy"
    click_button "Create Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_content("The fanciest cat I've seen all day.")
    within ("div.tags") do
      expect(page).to have_content("gangsta")
      expect(page).to have_content("fancy")
    end
    expect(page).to have_css("img[src='http://example.com/cat.png']")
  end
end
