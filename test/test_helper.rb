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

    click_on "login"

    fill_in "Username", with: "Brock"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Login"
    end
  end
end
