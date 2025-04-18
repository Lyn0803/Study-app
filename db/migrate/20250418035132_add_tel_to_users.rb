class AddTelToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tel, :string
    add_index :users, :tel, unique: true
  end
end
