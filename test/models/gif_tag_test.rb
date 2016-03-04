require "test_helper"

class GifTagTest < ActiveSupport::TestCase
  should belong_to(:gif)
  should belong_to(:tag)
end
