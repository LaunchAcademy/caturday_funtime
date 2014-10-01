require 'rails_helper'

feature 'submit cat' do
  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:sample_photo) do
    Rails.root.join("spec/data/cat-milk.jpg")
  end

  before :each do
    sign_in_as(user)
  end

  scenario 'user submits cat with external url' do
    visit "/cats/new"

    fill_in "Name", with: "Gangsta Cat"
    fill_in "or image URL", with: "http://example.com/cat.png"
    fill_in "Description", with: "The fanciest cat I've seen all day."
    click_button "Create Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_css("img[src='http://example.com/cat.png']")
  end

  scenario 'user uploads a valid cat photo' do
    visit "/cats/new"

    fill_in "Name", with: "Milk's Favorite Kitteh"
    attach_file "cat_cat_photo", sample_photo
    click_button "Create Cat"

    expect(page).to have_content("Milk's Favorite Kitteh")
    expect(page).to have_css("img[alt=\"Cat milk\"]")
  end

  scenario "cannot create cat without file or url" do
    visit "/cats/new"

    fill_in "Name", with: "Elvis"
    click_button "Create Cat"

    expect(page).to have_content("Please enter either a url or upload a file.")
    expect(Cat.count).to eq(0)
  end

  scenario "must choose between file upload or external url" do
    visit "/cats/new"

    fill_in "Name", with: "Elvis"
    fill_in "or image URL", with: "http://example.com/cat.png"
    attach_file "cat_cat_photo", sample_photo

    click_button "Create Cat"

    expect(page).to have_content("too many cats")
    expect(Cat.count).to eq(0)
  end
end
