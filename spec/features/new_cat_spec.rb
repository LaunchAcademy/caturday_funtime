require "rails_helper"

feature "new cat" do
  scenario "user creates a new cat" do
    visit "/cats/new"

    fill_in "Name", :with => "Gangsta Cat"
    fill_in "Url", :with => "http://example.com/cat.png"
    fill_in "Description", :with => "The fanciest cat I've seen all day."
    click_button "Create Cat"

    expect(page).to have_content("Gangsta Cat")
    expect(page).to have_css("img[src='http://example.com/cat.png']")
  end

  scenario "user submits an empty form" do
    visit "/cats/new"

    fill_in "Name", :with => ""
    fill_in "Url", :with => ""
    fill_in "Description", :with => ""
    click_button "Create Cat"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Url can't be blank")
  end
end
