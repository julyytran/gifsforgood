class Tag < ActiveRecord::Base
  has_many :gif_tags, dependent: :destroy
  has_many :gifs, through: :gif_tags
  validates :name, presence: true, uniqueness: true
end
