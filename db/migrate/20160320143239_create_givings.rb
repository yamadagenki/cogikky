class CreateGivings < ActiveRecord::Migration
  def change
    create_table :givings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :wish, index: true, foreign_key: true
      t.string :state

      t.timestamps null: false
    end
  end
end
