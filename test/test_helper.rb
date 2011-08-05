ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

GirlFriday::Queue.immediate!

class ActiveSupport::TestCase
  fixtures :all
end
