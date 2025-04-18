class AddTableUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.integer :age
      t.float :weight
      t.float :height
      t.string :gender


      t.timestamps
    end
    
  end
end
