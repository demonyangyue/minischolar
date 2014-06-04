ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'time'
require 'logger'
require 'carrierwave'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  CARRIERWAVE_DIRECTORY = "carrierwave#{Time.now.to_i}" unless defined?(CARRIERWAVE_DIRECTORY)


  def file_path( *paths )
    File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', *paths))
  end

  def public_path( *paths )
    File.expand_path(File.join(File.dirname(__FILE__), 'public', *paths))
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end
