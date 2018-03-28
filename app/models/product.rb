class Product < ApplicationRecord
  has_many :orders

  def self.search(search_term)
    matching_operator = Rails.env.development? ? "LIKE" : "ilike"
    Product.where("name #{matching_operator} ?", "%#{search_term}")
  end
end
