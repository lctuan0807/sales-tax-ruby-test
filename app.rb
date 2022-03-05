require 'csv'
require_relative './lib/model/receipt.rb'
require_relative './lib/model/item'
require_relative './lib/model/product'
require_relative './lib/services/exports/receipt_exporter'

file_pairs = [
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

file_pairs.each do |file_pair|
  receipt = Receipt.new
  file = File.read(file_pair[:input])
  input_data_arr =  CSV.parse(file, headers: true, header_converters: :symbol).map(&:to_h)
  input_data_arr.each do |data|
    product = Product.new(name: data[:product], price: data[:price])
    item = Item.new(product: product, quantity: data[:quantity])
    receipt.add_item(item)
  end
  receipt_exporter = Exports::ReceiptExporter.new(output_path: file_pair[:output])
  receipt_exporter.receipt = receipt
  receipt_exporter.perform
end
