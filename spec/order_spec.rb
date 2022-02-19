require_relative '../lib/order.rb'

RSpec.describe Order do
  let(:order) { Order.new(order: order_arr) }
  let(:order_arr) { [1, 'Music CD', 14.99] }

  describe "#order_with_tax" do
    let(:expected_result) { [1, 'Music CD', 16.49] }

    it 'return an array of order item with tax' do
      expect(order.order_with_tax).to eq expected_result
    end
  end
end

