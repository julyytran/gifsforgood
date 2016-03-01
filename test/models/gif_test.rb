require 'test_helper'

class GifTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:price)
  should validate_presence_of(:image)
end
