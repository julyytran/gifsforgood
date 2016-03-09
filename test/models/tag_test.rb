require "test_helper"

class TagTest < ActiveSupport::TestCase
  should have_many(:gifs).through(:gif_tags)
end
