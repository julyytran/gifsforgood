class AddAttachmentColumnsToGifs < ActiveRecord::Migration
  def change
    add_attachment :gifs, :image
  end
end
