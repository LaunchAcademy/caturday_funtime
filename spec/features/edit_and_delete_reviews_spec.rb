require "rails_helper"

feature "edit and delete reviews" do
  before :each do
    sign_in
  end

  scenario "user edits a review" do
    visit cat_path(@cat)

    click_link "Edit"
    fill_in "Edit your review:", with: "I totes luv this cat."
    click_button "Update Review"

    expect(page).to have_content("I totes luv this cat.")
  end

  scenario "user enters and empty form when editing a review" do
    visit cat_path(@cat)

    click_link "Edit"
    fill_in "Edit your review:", with: ""
    click_button "Update Review"

    expect(page).to have_content("fael lol, try again wow")
  end

  scenario "user deletes a review" do
    visit cat_path(@cat)

    click_link "Delete Plz"

    expect(page).to have_content("Deleted review")
    expect(@cat.reviews.count).to eq(0)
  end

  def sign_in
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

    @cat = FactoryGirl.create(:cat, user: @user)
    @review = Review.create!(review: "I absolutely LOVE this cat picture",
                             user_id: @user.id,
                             cat_id: @cat.id)
  end
end
