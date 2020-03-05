class AddBodyToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :body, :text
  end
end
