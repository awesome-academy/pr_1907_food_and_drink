class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :user
      t.string :email
      t.string :phone
      t.string :avatar
      t.string :password_digest
      t.string :remember_digest
      t.datetime :activated
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
