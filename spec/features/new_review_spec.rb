require "rails_helper"

feature "new review" do
  before :each do
    @user = User.create!(email: "foo@example.com", password: "123456578")

    visit "/users/sign_in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    @cat = Cat.create!(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg", user: @user)
  end

  scenario "user creates a review" do
    visit cat_path(@cat)

    fill_in "Write a review", with: "I absolutely LOVE this cat picture"
    click_button "Create Review"

    expect(page).to have_content("I absolutely LOVE this cat picture")
  end

  scenario "user submits an empty form" do
    visit cat_path(@cat)

    fill_in "Write a review", with: ""
    click_button "Create Review"

    expect(page).to have_content("fael review lol, try again wow")
  end
end
