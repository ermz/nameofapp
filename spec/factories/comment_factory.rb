FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    body "great record"
    rating 4
    association :product, factory: :product
  end
end
