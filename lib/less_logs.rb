
require "less_logs/version"
#require 'railtie.rb' if defined?(Rails)
require 'less_logs/config'
require 'less_logs/less_logs'
require 'less_logs/log_factory'
require 'less_logs/event'




module LessLogs
  class Log
  extend LessLogs::Config
  
    class << self
      def config
        Config.config
      end
  
      def logger
        LogFactory.logger
      end
      def failure
        LogFactory.failure
      end
  
      def event options
        Event.create options
      end
  
    end
  end
end
