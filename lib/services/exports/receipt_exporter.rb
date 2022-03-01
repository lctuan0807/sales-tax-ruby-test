require_relative './base_exporter'
require_relative '../../helpers/utility'

module Exports
  class ReceiptExporter < BaseExporter
    include Utility

    attr_accessor :receipt

    private

    def default_header
      ['Quantity', 'Product', 'Price']
    end

    def rows_exporting
      unless receipt.nil?
        receipt.items.each { |item| @csv << [item.quantity, item.product.name, format_money(item.total_cost)] }
        @csv << ['', '']
        @csv << ['Sales Taxes', format_money(receipt.total_sales_tax).to_s]
        @csv << ['Total', format_money(receipt.total_cost)]
      end
    end
  end
end
