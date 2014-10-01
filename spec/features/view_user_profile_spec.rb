require 'rails_helper'

feature 'view user profile' do

  scenario 'user visits their profile page and sees a list of their cats' do
    user = FactoryGirl.create(:user)
    user_cats = FactoryGirl.create_list(:cat, 5, user: user)
    other_cats = FactoryGirl.create_list(:cat, 5)

    sign_in_as(user)

    visit user_path(user)

    user_cats.each do |cat|
      expect(page).to have_content(cat.name)
    end

    other_cats.each do |cat|
      expect(page).to_not have_content(cat.name)
    end
  end
end
