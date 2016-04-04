class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to_user_id, index: true
      t.integer :from_user_id, index: true
      t.datetime :read_time, default: nil
      t.text :body, default: ''

      t.timestamps null: false
    end
  end
end
