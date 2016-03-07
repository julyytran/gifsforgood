class Gif < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  has_many :tags, through: :gif_tags
  has_many :orders, through: :order_gifs
  has_many :gif_tags
  has_many :order_gifs


  def format_price
    price.to_f / 100
  end


end
