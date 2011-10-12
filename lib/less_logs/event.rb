
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
        Log.logger.fatal("Can't send without both an API_KEY and PASSWORD") and return if user_name == '' || password == ''
        Log.logger.debug Log.config
        basic_auth user_name, password
        res = post "#{url}events.json", :body => {:event => params}
        Log.failure.fatal(params.merge(:api_key => user_name, :res => res).reverse_merge(:date => Date.today).to_yaml) unless res && res.code == 200
        res
      end
    end
  end
end