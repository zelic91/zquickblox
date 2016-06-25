require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/zquickblox.rb', __FILE__)

ZQuickblox.configure do |config|
  config.app_id      = ENV['QB_APP_ID']
  config.auth_key    = ENV['QB_AUTH_KEY']
  config.auth_secret = ENV['QB_AUTH_SECRET']
end
