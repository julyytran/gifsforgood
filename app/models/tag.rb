class Tag < ActiveRecord::Base
  has_many :gifs, through: :gif_tags
  has_many :gif_tags
end
