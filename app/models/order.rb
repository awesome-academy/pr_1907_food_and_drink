class Order < ApplicationRecord
  belongs_to :user
  
  before_create :set_order_status

  before_save :update_subtotal

  has_many :order_items

  enum status: {"đang đặt hàng": 0, "đã đặt hàng": 1, "đã giao hàng": 2, "huỷ đơn": 3}

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
  def set_order_status
    self.status = "đang đặt hàng"
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
