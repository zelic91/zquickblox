require_relative "zquickblox/version"
require_relative "zquickblox/error"
require_relative "zquickblox/request"
require_relative "zquickblox/signature"
require_relative "zquickblox/session"
require_relative "zquickblox/user"
require_relative "zquickblox/util"
require "faraday"
require "json"

module ZQuickblox
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield(self.config)
  end

  class Config
    attr_accessor :app_id, :auth_key, :auth_secret
  end
end
