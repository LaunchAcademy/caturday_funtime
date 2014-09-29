FactoryGirl.define do
  factory :user do
    email "fake@fake.com"
    password "12345678"
    confirmed_at {Time.now}
  end
end
