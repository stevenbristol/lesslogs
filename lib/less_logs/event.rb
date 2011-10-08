
require 'httparty'
module Less::Logs
  class Event   
    include HTTParty
    #debug_output $stderr
    
  
    class << self
      def user_name
        Less::Logs.config.api_key
      end
      def password
        Less::Logs.config.password
      end
      def url
         Less::Logs.config.url
      end
      def t
        p Less::Logs.config
      end
    
      def create params
        basic_auth user_name, password
        post "#{url}events.json", :body => {:event => params}
      end
    end
  end
end