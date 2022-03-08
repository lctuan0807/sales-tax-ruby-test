require_relative '../spec_helper'

RSpec.describe Product do
  let(:product) { Product.new(name: product_name, price: 14.99) }
  let(:product_name) { 'Music CD' }

  describe "#new" do
    it "takes two parameters and returns a Product object" do
      expect(product).to be_an_instance_of Product
    end
  end

  describe '#imported?' do
    context 'when not imported product' do
      it 'return false' do
        expect(product.imported?).to be_falsey
      end
    end

    context 'when imported product' do
      let(:product_name) { 'Imported Music CD' }

      it 'return true' do
        expect(product.imported?).to be_truthy
      end
    end
  end

  describe '#exempt_tax?' do
    context 'when not exempt tax product' do
      it 'return false' do
        expect(product.exempt_tax?).to be_falsey
      end
    end

    context 'when exempt tax product' do
      let(:product_name) { 'chocolates bar' }

      it 'return true' do
        expect(product.exempt_tax?).to be_truthy
      end
    end
  end
end
