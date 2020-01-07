class Product < ApplicationRecord
  belongs_to :category

  has_many :product_order
  has_many :rates
  has_many :comments
  
  mount_uploader :picture, PictureUploader
  
  validates :price, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }
  validates :category_id, presence: true
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
end
