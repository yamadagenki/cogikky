class CreateWishImages < ActiveRecord::Migration
  def change
    create_table :wish_images do |t|
      t.string :title
      t.string :image
      t.references :wish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
