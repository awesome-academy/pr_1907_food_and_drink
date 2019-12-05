class ProductCategory < ApplicationRecord
  has_many :product_id
  has_many :category_id
end
