require 'rails_helper'

feature 'user pages through cats and reviews' do
  before :each do
    user = FactoryGirl.create(:user)
    modern_cats = FactoryGirl.create_list(:cat, CatsController::CATS_PER_PAGE)
    @old_cat = FactoryGirl.create(:cat, updated_at: Date.yesterday)
    reviews = FactoryGirl.create_list(:review, 4, user_id: user.id, cat: @old_cat)
    @review = reviews.first
  end

  scenario 'user only sees new cats' do
    modern_cats = FactoryGirl.create_list(:cat, CatsController::CATS_PER_PAGE)
    old_cat = FactoryGirl.create(:cat, created_at: Date.yesterday)

    visit cats_path
    expect(page).to_not have_content(old_cat.name)
  end

  scenario 'cats are created and user views 2nd page' do
    modern_cats = FactoryGirl.create_list(:cat, CatsController::CATS_PER_PAGE)
    old_cat = FactoryGirl.create(:cat, created_at: Date.yesterday)

    visit cats_path

    click_link "Next"

    expect(page).to have_content(old_cat.name)
  end

  scenario 'user visits a cat and views 2nd page of reviews' do
    cat = FactoryGirl.create(:cat)
    new_reviews = FactoryGirl.create_list(:review, 3, cat: cat)
    old_review = FactoryGirl.create(:review, cat: cat, created_at: Date.yesterday)

    visit cat_path(cat)

    new_reviews.each do |review|
      expect(page).to have_content(review.review)
    end

    expect(page).to_not have_content(old_review.review)

    click_link "2"

    new_reviews.each do |review|
      expect(page).to_not have_content(review.review)
    end

    expect(page).to have_content(old_review.review)
  end
end
