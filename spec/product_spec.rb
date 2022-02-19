require_relative '../lib/product'

RSpec.describe Product do
  let(:product) { Product.new(name: product_name, price: 14.99) }
  let(:product_name) { 'Music CD' }

  describe "#new" do
    it "takes two parameters and returns a Product object" do
      expect(product).to be_an_instance_of Product
    end
  end

  describe "#tax_rate" do
    context 'product is a free tax item' do
      context 'imported product' do
        let(:product_name) { 'Imported Math book' }

        it 'return 0.05' do
          expect(product.tax_rate).to eq 0.05
        end
      end

      context 'not imported product' do
        let(:product_name) { 'Math book' }

        it 'return 0' do
          expect(product.tax_rate).to eq 0
        end
      end
    end

    context 'product is not a free tax item' do
      context 'imported product' do
        let(:product_name) { 'Imported Music CD' }

        it 'return 0.15' do
          expect(product.tax_rate).to eq(0.1 + 0.05)
        end
      end

      context 'not imported product' do
        let(:product_name) { 'Music CD' }

        it 'return 0.1' do
          expect(product.tax_rate).to eq 0.1
        end
      end
    end
  end
  
end
