class AddCharityToGifs < ActiveRecord::Migration
  def change
    add_reference :gifs, :charity, index: true, foreign_key: true
  end
end
