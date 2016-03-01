class Gif < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :tags, through: :gif_tags
  has_many :gif_tags
end
