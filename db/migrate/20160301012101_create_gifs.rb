class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image

      t.timestamps null: false
    end
  end
end
