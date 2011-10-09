# -*- encoding: utf-8 -*-
require File.expand_path('../lib/less_logs/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["stevenbristol"]
  gem.email         = ["stevenbristol@gmail.com"]
  gem.description   = "Less Logs Ruby API"
  gem.summary       = "Less Logs Ruby API!"
  gem.homepage      = "http://lesslogs.com"

  #gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  #gem.files         = Dir['lib/**/*.rb'] + Dir['lib/tasks/*'] 
  gem.files         = [
                        "lib/less_logs/config.rb", 
                        "lib/less_logs/event.rb", 
                        "lib/less_logs/less_logs.rb", 
                        "lib/less_logs/version.rb", 
                        "lib/less_logs/log_factory.rb", 
                        "lib/less_logs.rb", 
                        "lib/railtie.rb"
                      ] 
  #gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "less_logs"
  gem.require_paths = ["lib"]
  gem.version       = LessLogs::VERSION
  gem.add_dependency('httparty', '0.7.8')
end
