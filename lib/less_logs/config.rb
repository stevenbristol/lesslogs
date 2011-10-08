#require 'active_support/configurable'

module Less::Logs::Config
  
  def self.configure(&block)
    yield @config ||= Less::Logs::Config::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
   attr_accessor :debug, :api_key, :password, :local_dev
    def initialize
      @debug = false
      @api_key = ""
      @password = ""
      @local_dev = false
    end
    
    def url
      local_dev ? "http://localhost:3000/" : "http://lesslogs.com/"
    end
  end

  configure do |config|
    config.debug = false
    config.api_key = ""
    config.password = ""
    config.local_dev = false
  end
end
