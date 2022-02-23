require 'csv'
require 'bigdecimal'
require 'bigdecimal/util'

class ReceiptExporter
  def initialize(receipt:, output_path:)
    @receipt = receipt
    @output_path = output_path
  end

  def export_to_csv
    CSV.open(@output_path, "wb") do |csv|
      @csv = csv
      @csv << default_header
      rows_exporting
    end
    @output_path
  end

  private

  def default_header
    ['Quantity', 'Product', 'Price']
  end

  def rows_exporting
    @receipt.line_items.each { |item| @csv << [item.quantity, item.product.name, format_money(item.cost)] }
    @csv << ['', '']
    @csv << ['Sales Taxes', format_money(@receipt.total_sales_tax)]
    @csv << ['Total', format_money(@receipt.total_cost)]
  end

  def format_money(money)
    money.to_f.round(2)
  end
end
