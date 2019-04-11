FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "My article #{n}" }
    sequence(:content) { |n| "My article content #{n}" }
    sequence(:slug) { |n| "my-article-#{n}" }
    association :user
  end
end
