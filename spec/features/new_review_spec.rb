require "rails_helper"

feature "new review" do
  scenario "user creates a review" do
    cat = Cat.create(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg")
    visit cat_path(cat)

    fill_in "Review", with: "I absolutely LOVE this cat picture"
    click_button "Create Review"

    expect(page).to have_content("I absolutely LOVE this cat picture")
  end

  scenario "user submits an empty form" do
    cat = Cat.create(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg")
    visit cat_path(cat)

    fill_in "Review", with: ""
    click_button "Create Review"

    expect(page).to have_content("Review can't be blank")
  end
end
