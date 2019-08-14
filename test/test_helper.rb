ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/autorun'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class PolicyTest < ActiveSupport::TestCase
  def permit(current_user, record, action)
    self.class.to_s.gsub(/Test/, '').constantize.new(current_user, record).public_send("#{action.to_s}?")
  end

  def forbid(current_user, record, action)
    !permit(current_user, record, action)
  end
end
