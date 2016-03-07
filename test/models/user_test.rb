require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:password)
  should validate_presence_of(:username)
end
