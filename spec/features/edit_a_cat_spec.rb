require 'rails_helper'

feature 'edit cat' do
  before :each do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

    @cat = FactoryGirl.create(:cat, user: @user)
    @cat.tag_string="josh uncanny"
  end

  scenario 'user edits previous cat' do
    visit edit_cat_path(@cat)

    fill_in "Name", with: "Gangsta Cat"
    fill_in "or use an image URL", with: "http://example.com/cat.png"
    fill_in "Description", with: "The fanciest cat I've seen all day."
    fill_in "Tags", with: "gangsta fancy"
    click_button "Update Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_content("The fanciest cat I've seen all day.")
    within ("div.tags") do
      expect(page).to have_content("gangsta")
      expect(page).to have_content("fancy")
      expect(page).to_not have_content("josh")
      expect(page).to_not have_content("uncanny")
    end
    expect(page).to have_css("img[src='http://example.com/cat.png']")
  end

  scenario 'user submits blank edits' do
    visit edit_cat_path(@cat)

    fill_in "Name", with: ""
    fill_in "or use an image URL", with: ""
    fill_in "Description", with: ""
    click_button "Update Cat"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Please enter either a url or upload a file.")
  end
end
