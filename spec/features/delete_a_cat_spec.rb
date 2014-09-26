require 'rails_helper'
require 'pry-rails'

feature 'kill cat' do
  before :each do
    @user = build(:user)

    visit "/users/sign_in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    @cat = Cat.create!(name: "fancy cat", url: "http://a.dilcdn.com/bl/wp-content/uploads/sites/8/2012/5/fancy-cat.jpg", user: @user)
  end

  scenario 'user murders a cat in cold blood' do
    visit edit_cat_path(@cat)

    #click_link "Edit"

    click_link "Wow wat a dumm cat wow, delete plz"

    expect(page).to have_content("No cats yet!")
  end
end
