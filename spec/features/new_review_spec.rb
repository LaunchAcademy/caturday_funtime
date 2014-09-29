require "rails_helper"

feature "new review" do
  before :each do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

   @cat = FactoryGirl.create(:cat, user: @user)
  end

  scenario "user creates a review" do
    visit cat_path(@cat)

    fill_in "Write a review", with: "I absolutely LOVE this cat picture"
    click_button "Create Review"

    expect(page).to have_content("I absolutely LOVE this cat picture")
  end

  scenario "user submits an empty form" do
    visit cat_path(@cat)

    fill_in "Write a review", with: ""
    click_button "Create Review"

    expect(page).to have_content("fael review lol, try again wow")
  end
end
