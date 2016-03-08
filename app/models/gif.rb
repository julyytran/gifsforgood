class Gif < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  has_many :tags, through: :gif_tags
  has_many :orders, through: :order_gifs
  has_many :gif_tags
  has_many :order_gifs

  has_attached_file :image, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    styles: {
      favicon: '16x16>',
      square: '200x200#',
      medium: '300x300>'
    }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def format_price
    price.to_f / 100
  end
end
