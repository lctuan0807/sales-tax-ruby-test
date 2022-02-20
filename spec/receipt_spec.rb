require_relative '../lib/receipt'

RSpec.describe Receipt do
  let(:receipt) { Receipt.new(items: items) }
  let(:items) do
    [
      [1, 'Music CD', '14.99'],
      [1, 'Chocolate Bar', '0.85']
    ]
  end

  describe "#add_item" do
    let(:new_item) { [1, 'book', '7.92'] }
    let(:new_order_arr) { items << new_item }

    it 'add new item to list' do
      expect(receipt.add_item(new_item)).to eq new_order_arr
    end
  end

  describe "#calculate" do
    let(:expected_items) { [[1, "Music CD", 16.49], [1, "Chocolate Bar", 0.85]] }

    it 'return an array of order item with tax' do
      receipt.calculate

      expect(receipt.total_cost).to eq 17.34
      expect(receipt.total_sales_taxes).to eq 1.5
      expect(receipt.items_with_tax).to eq expected_items
    end
  end
end

