require "rails_helper"

feature "Users search for cat" do
  before :each do
    @cat = FactoryGirl.create(:cat, name: "Bojangles", description: "Lil' Bo!")
  end

  scenario "guest looks for a specific cat" do
    visit search_index_path

    fill_in "Search by name or description", with: "Bojangles"

    click_button "Search"

    expect(page).to have_content(@cat.name)
  end

  scenario "guest searches by description" do
    visit search_index_path

    fill_in "Search by name or description:", with: "Lil"

    click_button "Search"

    expect(page).to have_content(@cat.name)
  end
end
