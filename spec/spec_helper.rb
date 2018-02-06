require 'rubygems'
require 'age_jp'
require 'timecop'
require "active_support/testing/time_helpers"

RSpec.configure do |config|
  config.include ActiveSupport::Testing::TimeHelpers
end
