class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.references :product_id, foreign_key: true
      t.references :category_id, foreign_key: true

      t.timestamps
    end
  end
end
