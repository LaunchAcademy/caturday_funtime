require "rails_helper"

feature "view cats" do
  scenario "list cats on index page" do
    cats = []
    5.times do |i|
      cats << Cat.create!(
        name: "very fancy cat #{i}",
        caption: "fanciest cat I've seen all day",
        url: "http://example.com/cat_#{i}.png")
    end

    visit cats_path

    cats.each do |cat|
      expect(page).to have_content(cat.name)
      expect(page).to have_css("img[src=\"#{cat.url}\"]")
    end
  end
end
