require 'active_support/configurable'

module Less::Logs::Config
  
  def self.configure(&block)
    yield @config ||= Less::Apps::Config::Configuration.new
  end

  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :debug
    config_accessor :api_key
  end

  configure do |config|
    config.debug = false
    config.api_key = ""
  end
end
