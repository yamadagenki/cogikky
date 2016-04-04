class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :working
      t.string :education
      t.integer :gender

      t.timestamps null: false
    end
  end
end
