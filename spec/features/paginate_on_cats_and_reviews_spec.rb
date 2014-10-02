require 'rails_helper'

feature 'user pages through cats and reviews' do
  before :each do
    @modern_cats = FactoryGirl.create_list(:cat, CatsController::CATS_PER_PAGE)
    @old_cat = FactoryGirl.create(:cat, created_at: Date.yesterday)
  end

  scenario 'user only sees new cats' do
    visit cats_path
    expect(page).to_not have_content(@old_cat.name)
    expect(page).to have_content(@modern_cats.first.name)
    expect(page).to have_content(@modern_cats.last.name)
  end

  scenario 'user views 2nd page and sees older cats' do
    visit cats_path
    click_link "Next"
    expect(page).to have_content(@old_cat.name)
  end

  scenario 'user visits a cat and views 2nd page of reviews' do
    cat = FactoryGirl.create(:cat)
    new_reviews = FactoryGirl.create_list(:review, 3, cat: cat)
    old_review = FactoryGirl.create(:review,
                                    cat: cat,
                                    created_at: Date.yesterday)
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
