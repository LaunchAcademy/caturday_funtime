require 'rails_helper'

feature 'admin can manage users' do
  before :each do
    sign_in
  end

  scenario 'admin visits users index' do
    visit '/admin/users'
    expect(page).to have_content(@user.email)
  end

  scenario 'admin deletes miscreant user' do
    visit '/admin/users'
    click_button "Delete this user"
    expect(page).to have_content("You've successfully deleted this loser.")
  end

  def sign_in
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user, role: 'admin')

    sign_in_as(@admin)

    @cat = FactoryGirl.create(:cat, user: @user)
    @review = Review.create!(review: "I absolutely LOVE this cat picture",
                            user_id: @user.id,
                            cat_id: @cat.id)
  end
end

feature 'admin can manage content' do
  before :each do
    sign_in
  end

  scenario 'admin deletes inappropriate cat' do
    visit cat_path(@cat)
    click_button "PURGE THIS SCOURGE"
    expect(page).to have_content("Cat Destroyed")
  end

  scenario 'admin deletes useless review' do
    visit cat_path(@cat)
    click_link "Delete Plz"
    expect(page).to have_content("Deleted review")
    expect(@cat.reviews.count).to eq(0)
  end

  def sign_in
  @user = FactoryGirl.create(:user)
  @admin = FactoryGirl.create(:user, role: 'admin')

  sign_in_as(@admin)

  @cat = FactoryGirl.create(:cat, user: @user)
  @review = Review.create!(review: "I absolutely LOVE this cat picture",
                          user_id: @user.id,
                          cat_id: @cat.id)
  end
end