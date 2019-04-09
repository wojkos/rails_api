FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "jon_#{n}" }
    name { "Jon Doe" }
    url { "http://example.com" }
    avatar_url { "http://example.com/avatar" }
    provider { "github" }
  end
end
