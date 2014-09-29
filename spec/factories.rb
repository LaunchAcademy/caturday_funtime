FactoryGirl.define do
  factory :user do
    email "fake@fake.com"
    password "12345678"
    confirmed_at {Time.now}
  end

  factory :cat do
    name "this cat is Josh"
    url "https://i0.wp.com/24.media.tumblr.com/tumblr_mafbqoswHb1qz8nbdo1_1280.jpg"
    description "wow this cat is totally josh wow so uncanny, much resemblanc3 wow"
  end
end
