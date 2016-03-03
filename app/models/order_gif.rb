class OrderGif < ActiveRecord::Base
  belongs_to :order
  belongs_to :gif
end
