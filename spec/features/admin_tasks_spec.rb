require 'rails_helper'

feature 'admin can manage users' do
  before :each do
    sign_in
  end

  scenario 'admin visits users index' do
    visit '/admin/users'
    expect(page).to have_content(@person.email)
  end

  scenario 'admin deletes miscreant user' do
    visit '/admin/users'
    click_button "Delete this user"
    expect(page).to have_content("You've successfully deleted this loser.")
  end

  def sign_in
    @user = User.create!(email: "foo@example.com", password: "12345678", role: 'admin')
    @person = User.create!(email: "foo2@example.com", password: "12345678", role: 'member')

    visit "/users/sign_in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
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
    @user = User.create!(email: "foo@example.com", password: "12345678", role: 'admin')
    @person = User.create!(email: "foo2@example.com", password: "12345678", role: 'member')

    visit "/users/sign_in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    @cat = Cat.create!(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg", user_id: @person.id)
    @review = Review.create!(review: "I absolutely LOVE this cat picture",
                            user_id: @person.id,
                            cat_id: @cat.id)
  end
end
