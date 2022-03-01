require_relative '../spec_helper'

RSpec.describe Item do
  let(:line_item) { Item.new(product: product, quantity: 1) }
  let(:product) { Product.new(name: 'music cd', price: 14.99) }
  let(:product_tax) { 1.5 }

  before { allow(product).to receive(:sales_tax).and_return(product_tax) }

  describe "#new" do
    it "takes two parameters and returns a Product object" do
      expect(line_item).to be_an_instance_of Item
    end
  end

  describe '#tax' do
    it 'return calculated sales tax' do
      expect(line_item.tax).to eq product_tax
    end
  end

  describe '#total_cost' do
    it 'return calculated cost' do
      expect(line_item.total_cost).to eq BigDecimal('16.49')
    end
  end

  # describe '#display' do
  #   let(:expected_string) { "1, music cd, 16.49" }

  #   it 'return formatted string' do
  #     expect(line_item.display).to eq expected_string
  #   end
  # end
end
