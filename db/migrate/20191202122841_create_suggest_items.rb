class CreateSuggestItems < ActiveRecord::Migration[5.2]
  def change
    create_table :suggest_items do |t|
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end