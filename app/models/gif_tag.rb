class GifTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :gif
end
