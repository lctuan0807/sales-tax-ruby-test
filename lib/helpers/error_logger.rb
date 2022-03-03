require 'logger'

module Helpers
  module ErrorLogger
    def log(error)
      logger.error(error.message)
    end

    private

    def logger
      @logger ||= Logger.new(log_file)
    end

    def log_file
      File.join("lib/log/error_log.log")
    end
  end
end