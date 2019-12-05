class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_order
  has_many :rates
  has_many :comments
end
