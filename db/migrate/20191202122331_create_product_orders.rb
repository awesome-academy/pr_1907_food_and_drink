class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.references :order_id, foreign_key: true
      t.references :product_id, foreign_key: true
      t.references :quantity, foreign_key: true
      t.references :price, foreign_key: true

      t.timestamps
    end
  end
end
