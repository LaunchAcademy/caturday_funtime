require 'rails_helper'

feature 'user pages through cats and reviews' do
  before :each do
    @user = FactoryGirl.create(:user)
    @cat_array = FactoryGirl.create_list(:cat, 10, user: @user)
    @cat = @cat_array.last
    @reviews = FactoryGirl.create_list(:review, 10, user_id: @user.id, cat: @cat)
  end

  scenario 'cats are created and user views 2nd page' do
    visit cats_path

    within("nav.pagination") do
      expect(page).to have_content("2")
      click_link "2"
    end

    assert current_url == cats_url(:page => 2)
  end

  scenario 'user visits a cat and views 2nd page of reviews' do

    visit cat_path(@cat)

    within("nav.pagination") do
      expect(page).to have_content("2")
      click_link "2"
    end

    assert current_url == cat_url(@cat, :page => 2)
  end
end
