require_relative '../lib/receipt_printer'
require_relative '../lib/receipt'

RSpec.describe ReceiptPrinter do
  let(:receipt_printer) { ReceiptPrinter.new(receipt: receipt) }
  let(:receipt) { Receipt.new(items: items) }
  let(:items) do
    [
      [1, 'Music CD', '14.99'],
      [1, 'Chocolate Bar', '0.85']
    ]
  end

  describe "#new" do
    it "takes receipt as parameter and returns a ReceiptPrinter object" do
      expect(receipt_printer).to be_an_instance_of ReceiptPrinter
    end
  end

  describe "#print" do
    
  end
end
