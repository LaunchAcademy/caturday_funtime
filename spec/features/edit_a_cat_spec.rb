require 'rails_helper'

feature 'edit cat' do
  before :each do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

    @cat = Cat.create!(name: "fancy cat", url: "http://a.dilcdn.com/bl/wp-content/uploads/sites/8/2012/5/fancy-cat.jpg", user: @user)
  end

  scenario 'user edits previous cat' do
    visit edit_cat_path(@cat)

    fill_in "Name", with: "Gangsta Cat"
    fill_in "Url", with: "http://example.com/cat.png"
    fill_in "Description", with: "The fanciest cat I've seen all day."
    click_button "Update Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_css("img[src='http://example.com/cat.png']")
  end

  scenario 'user submits blank edits' do
    visit edit_cat_path(@cat)

    fill_in "Name", with: ""
    fill_in "Url", with: ""
    fill_in "Description", with: ""
    click_button "Update Cat"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Url can't be blank")
  end
end
