require 'rails_helper'

feature "cast upvotes and downvotes for cats and reviews" do
  before :each do
      sign_in
  end

  scenario "user upvotes a cat" do
    visit cat_path(@cat)

    find(:xpath, "//a/img[@alt='upvote']/..").click

    expect(@cat.vote_score).to eq(1)
  end

  scenario "user downvotes a cat" do
    visit cat_path(@cat)

    find(:xpath, "//a/img[@alt='downvote']/..").click

    expect(@cat.vote_score).to eq(-1)
  end

  scenario "user downvotes a cat again" do
    visit cat_path(@cat)

    find(:xpath, "//a/img[@alt='downvote']/..").click

    find(:xpath, "//a/img[@alt='downvoted']/..").click

    expect(@cat.vote_score).to eq(0)
  end

  scenario "user upvotes a review" do
    visit cat_path(@cat)

    find(:xpath, "//a/img[@alt='upvote review']/..").click

    expect(@review.vote_score).to eq(1)
  end

  scenario "user downvotes a review" do
    visit cat_path(@cat)

    find(:xpath, "//a/img[@alt='downvote review']/..").click

    expect(@review.vote_score).to eq(-1)
  end

  def sign_in
    @user = User.create!(email: "foo@example.com", password: "12345678")

    visit "/users/sign_in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    @cat = Cat.create!(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg", user: @user)
    @review = Review.create!(review: "I absolutely LOVE this cat picture",
                            user_id: @user.id,
                            cat_id: @cat.id)
  end
end
