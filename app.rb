require 'csv'
require_relative './lib/model/receipt.rb'
require_relative './lib/model/item'
require_relative './lib/model/product'
require_relative './lib/services/exports/receipt_exporter'

files = [
  {
    input: 'input_data/input1.csv',
    output: 'results/output1.csv',
  },
  {
    input: 'input_data/input2.csv',
    output: 'results/output2.csv',
  },
  {
    input: 'input_data/input3.csv',
    output: 'results/output3.csv',
  }
]

puts "--------- Exporting Receipt -----------"

files.each do |file|
  receipt = Receipt.new
  input_file = File.read(file[:input])
  input_data_arr =  CSV.parse(input_file, headers: true, header_converters: :symbol).map(&:to_h)
  input_data_arr.each do |data|
    product = Product.new(name: data[:product], price: data[:price])
    item = Item.new(product: product, quantity: data[:quantity])
    receipt.add_item(item)
  end
  receipt_exporter = Exports::ReceiptExporter.new(output_path: file[:output])
  receipt_exporter.receipt = receipt
  receipt_exporter.perform
end

puts "--------- Exported Receipt -----------"
