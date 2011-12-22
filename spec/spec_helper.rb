require 'rspec'
require 'fling'

require File.join('support/treetop_matcher.rb')

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end
