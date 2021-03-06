require 'simplecov'
# SimpleCov.start

require 'coveralls'
Coveralls.wear!

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "wrong/adapters/test_unit"

require 'factory_girl'

class ActiveSupport::TestCase
  include Concerns::Authorization

  require 'factory_girl_rails'
  include FactoryGirl::Syntax::Methods
end
