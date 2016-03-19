class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :comment
      t.text   :description
      t.string :state
      t.string :price_max
      t.string :price_min

      t.timestamps null: false
    end
  end
end
