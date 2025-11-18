# frozen_string_literal: true

# gem
require "logger"

# files
require_relative "jwt_revoker/version"
require_relative "jwt_revoker/config"
require_relative "jwt_revoker/client"

module JwtRevoker
  class Error < StandardError; end
  class << self
    attr_accessor :config
  end

  self.config = Config.new

  # 允許外部修改設定
  def self.configure
    yield(config)
  end

  # 全域 logger 實例
  LOGGER = Logger.new($stdout)
  LOGGER.level = Logger::INFO
  LOGGER.formatter = proc do |severity, datetime, _, msg|
    "[#{datetime.utc}] #{severity}: #{msg}\n"
  end
end
