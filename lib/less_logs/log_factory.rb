require 'logger'

module LessLogs
  class LogFactory
    def self.logger
      @logger ||= create_logger_with_fallback "lesslogs.log"
    end
    
    def self.failure
      @failure ||= create_logger_with_fallback "lesslogs_failures.log"
    end

    private
    def self.create_logger_with_fallback file_name
      begin
        log_dir = LessLogs::Log.config.log_dir
        Dir.mkdir(log_dir) unless File.directory?(log_dir)
        log_path = File.join(log_dir, file_name)
        log = Logger.new(log_path)
        log.level = LessLogs::Log.config.debug ? Logger::DEBUG : Logger::INFO
        def log.format_message(severity, timestamp, progname, msg)
          "[#{severity.upcase}] #{timestamp.utc.to_s} - #{msg2str(msg).gsub(/\n/, '').lstrip}\n"
        end
        def log.msg2str(msg)
          case msg
            when ::String
              msg
            when ::Exception
              "#{ msg.message } (#{ msg.class }): " <<
                (msg.backtrace || []).join(" | ")
            else
              msg.inspect
          end
        end
        log
      rescue
        return Rails.logger if defined?(Rails) && defined?(Rails.logger)
        return RAILS_DEFAULT_LOGGER if defined?(RAILS_DEFAULT_LOGGER)
        return Logger.new(STDERR)
      end
    end
  end
end