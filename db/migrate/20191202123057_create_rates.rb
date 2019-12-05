class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user_id, foreign_key: true
      t.references :product_id, foreign_key: true
      t.string :star

      t.timestamps
    end
  end
end
