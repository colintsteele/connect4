require 'pry'
require 'spec_helper'
require 'require_all'
require_all './lib'

RSpec.configure do |config|
  config.color = true
end
