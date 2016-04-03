class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :hashed_id
      t.string :name
      t.string :image
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :hashed_id, unique: true
    add_index :users, :uid, unique: true
  end
end
