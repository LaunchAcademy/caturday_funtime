require 'rails_helper'

feature 'user uploads a cat photo' do

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end

  let(:sample_photo) do
    Rails.root.join("spec/data/cat-milk.jpg")
  end

  scenario 'user uploads a valid cat photo' do
    visit "/cats/new"

    fill_in "Name", with: "Milk's Favorite Kitteh"
    attach_file "cat_cat_photo", sample_photo
    click_button "Create Cat"

    expect(page).to have_content("Milk's Favorite Kitteh")
    expect(page).to have_css("img[alt=\"Cat milk\"]")

  end

end
