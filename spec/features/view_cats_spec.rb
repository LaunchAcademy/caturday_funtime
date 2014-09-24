require "rails_helper"

feature "view cats" do
  scenario "list cats on index page" do
    cats = []
    user = User.create!(email: "foo@example.com", password: "123456578")
    5.times do |i|
      cats << Cat.create!(
        name: "very fancy cat #{i}",
        description: "fanciest cat I've seen all day",
        url: "http://example.com/cat_#{i}.png",
        user_id: user.id)
    end

    visit cats_path

    cats.each do |cat|
      expect(page).to have_content(cat.name)
      expect(page).to have_css("img[src=\"#{cat.url}\"]")
    end
  end
end

feature "view cat" do
  scenario "view cat" do
    user = User.create!(email: "foo@example.com", password: "123456578")
    cat = Cat.create!(name:"cat",
      url:"http://www.thinkcontra.com/wp-content/uploads/2013/04/whiskey-and-cats-photo-u1-e1365195706240.jpeg", user_id: user.id)

    visit cat_path(cat)
      expect(page).to have_content(cat.name)
      expect(page).to have_css("img[src=\"#{cat.url}\"]")
  end
end
