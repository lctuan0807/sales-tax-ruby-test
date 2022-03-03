require 'csv'
require_relative '../../helpers/error_logger'

module Exports
  class BaseExporter
    include Helpers::ErrorLogger

    def initialize(output_path:)
      @output_path = output_path
    end

    def perform
      CSV.open(@output_path, "wb") do |csv|
        @csv = csv
        @csv << default_header
        rows_extracting
      end
      @output_path
    rescue StandardError => e
      log e
      nil
    end

    private

    def default_header
      'default_header must be implemented in child class'
    end

    def rows_extracting
      'rows_exporting must be implemented in child class'
    end
  end
end
