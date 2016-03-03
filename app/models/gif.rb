class Gif < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :tags, through: :gif_tags
  has_many :orders, through: :order_gifs
  has_many :gif_tags
  has_many :order_gifs
end
