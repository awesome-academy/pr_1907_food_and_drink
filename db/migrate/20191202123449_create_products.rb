class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.references :price, foreign_key: true
      t.string :image
      t.string :description
      t.string :status
      t.string :product_order_id

      t.timestamps
    end
  end
end
