require "test_helper"

class AdminCanCreateItemTest < ActionDispatch::IntegrationTest
  test "admin can create an item" do
    skip
    create_and_return_admin
  end
end

# As an authenticated Admin:
#       I can create an item.
#An item must have a title, description and price.
#An item must belong to at least one category.
#The title and description cannot be empty.
#The title must be unique for all items in the system.
#The price must be a valid decimal numeric value and greater than zero.
#The photo is optional. If not present, a stand-in photo is used.
