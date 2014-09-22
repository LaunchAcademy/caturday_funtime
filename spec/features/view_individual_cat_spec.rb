require "rails_helper"

feature "view cat" do
  scenario "view cat" do
    @cat = Cat.create(name:"cat", url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg")

    visit cat_path(@cat)
      expect(page).to have_content(@cat.name)
      expect(page).to have_css("img[src=\"#{@cat.url}\"]")
  end
end
