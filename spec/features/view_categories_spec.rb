require "rails_helper"

feature "view categories" do
  before :each do
    make_categories
  end

  scenario "list categories on index page" do
    visit categories_path
      expect(page).to have_content("fluffy")
      expect(page).to have_content("snoozeball")
      expect(page).to have_content("d'awww")

    click_link("fluffy")
      expect(page).to have_content(@first_cat.name)
      expect(page).to have_content(@second_cat.name)
  end

  def make_categories
    @first_cat = FactoryGirl.create(:cat)
    @first_cat.tag_string=("fluffy snoozeball d'awww")
    @second_cat = FactoryGirl.create(:cat)
    @second_cat.tag_string=("fluffy happy cute")
  end
end
