require_relative '../lib/models/product'
require_relative '../lib/models/receipt'
require_relative '../lib/models/line_item'
require_relative '../lib/services/tax_calculator'
require_relative '../lib/services/receipt_exporter'
require_relative '../lib/application'

RSpec.describe Application do
  subject { described_class.new(file: file) }
  let(:file) { File.join('input_data', 'input1.csv') }
  let(:output_path) { File.join('lib', 'results', 'output_input1.csv') }
  let(:receipt_exporter) { double(:receipt_exporter) }
  let(:receipt) { double(:receipt) }
  let(:product) { Product.new(name: 'Music CD', price: 14.99) }
  let(:product2) { Product.new(name: 'Book', price: 12.49) }
  let(:product3) { Product.new(name: 'Chocolate Bar', price: 0.85) }
  let(:item1) { LineItem.new(product: product, quantity: 1) }
  let(:item2) { LineItem.new(product: product2, quantity: 1) }
  let(:item3) { LineItem.new(product: product3, quantity: 1) }
  let(:line_items) { [item1, item2, item3] }
  let(:input_data) { [["1", "Book", "12.49"], ["1", "Music CD", "14.99"], ["1", "Chocolate Bar", "0.85"]] }

  before do
    expect(subject).to receive(:output_path).and_return(output_path)
    expect(subject).to receive(:input_data).and_return input_data
    expect(Receipt).to receive(:new).and_return receipt
    expect(receipt).to receive(:add_item).exactly(3)
    expect(ReceiptExporter).to receive(:new).with(receipt: receipt, output_path: output_path).and_return receipt_exporter
    expect(receipt_exporter).to receive(:export_to_csv).once.and_return(output_path)
  end

  describe '#execute' do
    specify do
      expect(subject.execute).to eq output_path
    end
  end
end
