require 'rails_helper'

feature 'user pages through cats and reviews', focus: true do
  before :each do
    user = FactoryGirl.create(:user)
    modern_cats = FactoryGirl.create_list(:cat, CatsController::CATS_PER_PAGE)
    @old_cat = FactoryGirl.create(:cat, updated_at: Date.yesterday)
    reviews = FactoryGirl.create_list(:review, 4, user_id: user.id, cat: @old_cat)
    @review = reviews.first
  end

  scenario 'user only sees new cats' do

    visit cats_path

    !expect(page).to have_content(@old_cat.name)
  end

  scenario 'cats are created and user views 2nd page' do
    visit cats_path

    within("nav.pagination") do
      expect(page).to have_content("2")
      click_link "2"
    end

    expect(page).to have_content(@old_cat.name)
  end

  scenario 'user visits a cat and views 2nd page of reviews' do

    visit cat_path(@old_cat)

    within("nav.pagination") do
      expect(page).to have_content("2")
      click_link "2"
    end

    expect(page).to have_content(@old_cat.name)
    expect(page).to have_content(@review.review)
  end
end
