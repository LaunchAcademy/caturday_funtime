require 'rails_helper'
require 'pry-rails'

feature 'kill cat' do
  before :each do
    @user = FactoryGirl.create(:user)

    sign_in_as(@user)

    @cat = Cat.create!(name: "fancy cat", url: "http://a.dilcdn.com/bl/wp-content/uploads/sites/8/2012/5/fancy-cat.jpg", user: @user)
  end

  scenario 'user murders a cat in cold blood' do
    visit edit_cat_path(@cat)

    click_link "wow wat a dumm cat, delete plz!"

    expect(page).to have_content("No cats yet!")
  end
end
