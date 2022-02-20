require_relative '../lib/tax_calculator'
require_relative '../lib/product'

RSpec.describe TaxCalculator do
  let(:tax_calculator) { TaxCalculator.new(product_item: product) }
  let(:product) { Product.new(name: product_name, price: 7.2) }
  let(:product_name) { 'book' }

  describe "#new" do
    it "takes product_item and returns a TaxCalculator object" do
      expect(tax_calculator).to be_an_instance_of TaxCalculator
    end
  end

  describe '#calculate' do
    context 'exempt tax and imported product' do
      let(:product_name) { 'imported book' }

      specify do
        expect(tax_calculator.send(:base_tax_rate)).to eq 0 
        expect(tax_calculator.send(:tax_rate)).to eq 0
        expect(tax_calculator.send(:product_tax)).to eq 0.0
      end
    end

    context 'not exempt tax and imported product' do
      let(:product_name) { 'imported music cd' }

      specify do
        expect(tax_calculator.send(:base_tax_rate)).to eq 0 
        expect(tax_calculator.send(:tax_rate)).to eq 0
        expect(tax_calculator.send(:product_tax)).to eq 0.0
      end
    end

    context 'not exempt tax and not imported product' do
      let(:product_name) { 'music cd' }

      specify do
        expect(tax_calculator.send(:base_tax_rate)).to eq 0 
        expect(tax_calculator.send(:tax_rate)).to eq 0
        expect(tax_calculator.send(:product_tax)).to eq 0.0
      end
    end
  end
  
end
