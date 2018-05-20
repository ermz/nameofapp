FactoryBot.define do
  factory :product do
    name 'sample vinyl'
    description 'great'
    image_url 'http://vinlypic.something'
    colour 'red'
    price 24.99
    condition 'used'
  end
end
