class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  # def change
  #   add_column :users, :confirmation_token, :string
  #   add_column :users, :confirmed_at, :datetime
  #   add_column :users, :cofirmation_sent_at, :datetime
  # end
  # add_index :users, :confirmation_token, unique: true
  # # execute("UPDATE users SET confirmed_at = NOW()")  // User for MySQL
  # execute("UPDATE users SET confirmed_at = date('now')")
  def self.up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime

    add_index :users, :confirmation_token, unique: true
    execute("UPDATE users SET confirmed_at = date('now')")
  end

  def self.down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
