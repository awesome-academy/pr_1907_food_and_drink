class Product < ApplicationRecord
  belongs_to :category

  has_many :order_items
  has_many :rates
  has_many :comments
  
  mount_uploader :picture, PictureUploader
  
  validates :price, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }
  validates :category_id, presence: true
  validate :picture_size
  
  def self.get_random_products_for_home_page
    self.order("RANDOM()").limit(12)
  end
  
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
end
