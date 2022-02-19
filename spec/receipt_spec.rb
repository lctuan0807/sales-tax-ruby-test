require_relative '../lib/receipt'

RSpec.describe Receipt do
  let(:receipt) { Receipt.new(order_arr) }
  let(:order_arr) do
    [
      [1, 'Music CD', '14.99'],
      [1, 'Chocolate Bar', '0.85']
    ]
  end

  describe "#calculate" do
    it 'return an array of order item with tax' do
      receipt.calculate
      expect(receipt.total_price).to eq 1
      expect(receipt.sales_taxes).to eq 1
      expect(receipt.orders_with_tax).to eq 1
    end
  end
end

