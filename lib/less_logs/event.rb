
require 'httparty'
module LessLogs
  class Event   
    include HTTParty
    #debug_output $stderr
    
  
    class << self
      def user_name
        Log.config.api_key
      end
      def password
        Log.config.password
      end
      def url
         Log.config.url
      end
    
      def create params
        return if user_name == '' || password == ''
        Log.logger.debug Log.config
        basic_auth user_name, password
        res = post "#{url}events.json", :body => {:event => params}
        Log.failure.fatal(params.to_yaml) unless res && res.code == 200
        res
      end
    end
  end
end