require_relative '../spec_helper'

RSpec.describe Receipt do
  let(:receipt) { Receipt.new(items: items) }
  let(:product) { Product.new(name: 'music cd', price: 14.99) }
  let(:product2) { Product.new(name: 'book', price: 12.49) }
  let(:item1) { Item.new(product: product, quantity: 1) }
  let(:item2) { Item.new(product: product2, quantity: 1) }
  let(:items) { [item1, item2] }

  describe "#add_item" do
    let(:product3) { Product.new(name: 'chocolate', price: 12.49) }
    let(:item3) { Item.new(product: product3, quantity: 1) }

    it 'add new item to list' do
      expect(receipt.add_item(item3)).to match_array(items << item3)
    end
  end

  describe "#total_sales_tax" do
    before do 
      expect(item1).to receive(:tax).and_return(1.5)
      expect(item2).to receive(:tax).and_return(0)
    end

    it 'return total sales tax of items' do
      expect(receipt.total_sales_tax).to eq 1.5
    end
  end

  describe "#total_cost" do
    before do
      expect(item1).to receive(:total_cost).and_return(16.49)
      expect(item2).to receive(:total_cost).and_return(12.49)
    end

    it 'return total cost of items' do
      expect(receipt.total_cost).to eq (16.49 + 12.49)
    end
  end
  
end

