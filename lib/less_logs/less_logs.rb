
require 'less_logs/config'


# Backwards compatibility for a deprecated function fix. Remove when we don't care about 1.8 breakage.
unless RUBY_VERSION =~ /^1.9/
  class Hash
    def key(k)
      index(k)
    end
  end
end


module Less::Logs
  include Less::Logs::Config
  
class << self
  def config
    Config.config
  end
  
end
end
