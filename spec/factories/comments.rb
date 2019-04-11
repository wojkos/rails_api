FactoryBot.define do
  factory :comment do
    content { 'My comment' }
    article { association :article }
    user { association :user }
  end
end
