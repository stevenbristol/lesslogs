#require 'active_support/configurable'

module Less::Logs::Config
  
  def self.configure(&block)
    yield @config ||= Less::Logs::Config::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
   attr_accessor :debug, :api_key, :password
    #include ActiveSupport::Configurable
    def initialize
      debug = false
      api_key = ""
      password = ""
    end
  end

  configure do |config|
    config.debug = false
    config.api_key = ""
    config.password = ""
  end
end
