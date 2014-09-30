FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com"}
    password "12345678"
    confirmed_at {Time.now}
  end

  factory :cat do
    sequence(:url) { |n| "https://i0.wp.com/24.media.tumblr.com/tumblr_mafbqoswHb1qz8nbdo1_128#{n}.jpg"}
    name "this cat is Josh"
    description "wow this cat is totally josh wow so uncanny, much resemblanc3 wow"

    user
  end
end