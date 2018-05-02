FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com"}
  factory :user do
    email
    password "123456"
    first_name "Dact"
    last_name "Tory"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwerty"
    admin true
    first_name "Add"
    last_name "Min"
  end
end
