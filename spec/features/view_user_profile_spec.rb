require 'rails_helper'

feature 'view user profile' do
  before :each do
    @user = FactoryGirl.create(:user)
    cats = FactoryGirl.create_list(:cat, 5)
    sign_in_as(@user)
    cats[0].update_attribute(:user_id, @user.id)
    cats[1].update_attribute(:user_id, @user.id)
  end

  scenario 'user visits their profile page and sees a list of their cats' do
    visit user_path(@user)

    expect(@user.cats.count).to eq(2)
  end

end
