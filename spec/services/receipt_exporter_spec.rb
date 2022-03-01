require_relative '../spec_helper'

RSpec.describe Exports::ReceiptExporter do
  subject { described_class.new(output_path: output_path) }
  let(:output_path) { File.join('spec', 'fixtures', 'output_test.csv') }
  let(:receipt) { Receipt.new(items: [item_1, item_2, item_3]) }
  let(:item_1) { Item.new(product: product_1, quantity: 1) }
  let(:item_2) { Item.new(product: product_2, quantity: 1) }
  let(:item_3) { Item.new(product: product_3, quantity: 1) }
  let(:product_1) { Product.new(name: 'book', price: 12.49) }
  let(:product_2) { Product.new(name: 'music cd', price: 14.99) }
  let(:product_3) { Product.new(name: 'chocolate bar', price: 0.85) }

  let(:default_header) {  ['Quantity', 'Product', 'Price'].join(',') }

  before { subject.receipt = receipt }

  describe '#export_to_csv' do
    specify 'should export receipt to csv' do
      expect(subject.perform).to eq output_path
      csv_data = File.read(output_path)
      expect(csv_data).to include(default_header)
      expect(csv_data).to include("1,book,12.49")
      expect(csv_data).to include("1,music cd,16.49")
      expect(csv_data).to include("1,chocolate bar,0.85")
      expect(csv_data).to include("Sales Taxes,1.5")
      expect(csv_data).to include("Total,29.83")
    end
  end

  after { File.delete(output_path) if File.exist?(output_path) }
end
