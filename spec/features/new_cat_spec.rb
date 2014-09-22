require "rails_helper"

feature "new cat" do
  scenario "user creates a new cat" do
    visit "/cats/new"

    fill_in "Name", :with => "Fancy Cat"
    fill_in "Url", :with => "http://example.com/cat.png"
    fill_in "Description", :with => "The fanciest cat I've seen all day."
    click_button "Create Cat"

    expect(page).to have_content(cat.name)
    expect(page).to have_css("img[src=\"#{cat.url}\"]")
    expect(page).to have_content(cat.description)
  end
end
