class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :comment
      t.text   :description
      t.string :state
      t.integer :price_max
      t.integer :price_min
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps null: false
    end
  end
end
