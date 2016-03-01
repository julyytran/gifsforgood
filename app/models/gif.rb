class Gif < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :tags, through: :gif_tags
  has_many :gif_tags

  has_attached_file :image, styles: { full: "640x480>", animated_full: "320x240>", thumb: "160X120>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
