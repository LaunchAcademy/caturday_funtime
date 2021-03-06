require "rails_helper"

feature "view cats" do
  scenario "list cats on index page" do
    cats = FactoryGirl.create_list(:cat, 5)

    visit cats_path

    cats.each do |cat|
      expect(page).to have_content(cat.name)
      expect(page).to have_css("img[src=\"#{cat.url}\"]")
    end
  end
end

feature "view cat" do
  scenario "view cat" do
    @user = FactoryGirl.create(:user)
    @cat = FactoryGirl.create(:cat, user: @user)

    visit cat_path(@cat)
      expect(page).to have_content(@cat.name)
      expect(page).to have_css("img[src=\"#{@cat.url}\"]")
  end
end
