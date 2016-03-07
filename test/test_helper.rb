ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "capybara/rails"
require "minitest/pride"
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  DatabaseCleaner.strategy = :transaction
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    reset_session!
    DatabaseCleaner.start
    super
  end

  def teardown
    reset_session!
    DatabaseCleaner.clean
    super
  end

  def create_and_return_admin
    admin = User.create(username: "July", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end

  def create_and_login_user
    user = User.create(username: "Brock", password: "password")

    visit '/'

    click_on "Login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Login"
    end
  end

  def create_multiple_orders(num)
    num.times do
      user = create(:user)
      gif = create(:gif)
      order = user.orders.create(total_price: 100, status: "Ordered")
      order.order_gifs.create(
        gif_id: gif.id, quantity: 1, subtotal: 100
      )
      gif = create(:gif)
      order.order_gifs.create(
        gif_id: gif.id, quantity: 2, subtotal: 100
      )
    end
  end
end
