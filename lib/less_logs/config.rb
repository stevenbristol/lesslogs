#require 'active_support/configurable'

module LessLogs::Config
  
  def self.configure(&block)
    yield @config ||= LessLogs::Config::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
   attr_accessor :debug, :api_key, :password, :local_dev, :log_dir
    # def initialize
    #   @debug = false
    #   @api_key = ""
    #   @password = ""
    #   @local_dev = false
    #   @log_dir = ""
    # end
    
    def url
      local_dev ? "http://localhost:3000/" : "http://lesslogs.com/"
    end
    
    def log_dir
      @log_dir == '' || @log_dir.nil? ? ((defined?(Rails) && Rails.respond_to?(:root)) ? "#{Rails.root}/log" : "#{Dir.pwd}/log") : @log_dir
    end
  end

  configure do |config|
    config.debug = false
    config.api_key = ""
    config.password = ""
    config.local_dev = false
    config.log_dir = ''
  end
end
