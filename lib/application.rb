require 'csv'
require 'bigdecimal'
require 'bigdecimal/util'
require_relative './models/product'
require_relative './models/receipt'
require_relative './models/line_item'
require_relative './services/tax_calculator'
require_relative './services/receipt_exporter'

class Application
  def initialize(file:)
    @file = file
  end

  def execute
    input_data.each do |data|
      product = Product.new(name: data[1], price: data[2].to_d)
      line_item = LineItem.new(product: product, quantity: data[0].to_i)
      receipt.add_item(line_item)
    end

    receipt_exporter = ReceiptExporter.new(receipt: receipt, output_path: output_path)
    receipt_exporter.export_to_csv
  end

  private

  def output_path
    file_name =  File.basename(@file, '.csv')
    File.join('results', "output_#{file_name}.csv")
  end

  def receipt
    @cart ||= Receipt.new
  end

  def input_data
    CSV.read(@file)[1..-1]
  end
end
