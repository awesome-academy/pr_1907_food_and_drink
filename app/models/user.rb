class User < ApplicationRecord
  has_many :orders
  has_many :rates
  has_many :comments
  has_many :suggest_items
end