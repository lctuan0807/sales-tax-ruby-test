require_relative '../spec_helper'

RSpec.describe TaxCalculator do
  subject { described_class.new(item: item) }
  let(:item) { Product.new(name: product_name, price: 14.99) }

  describe "#calculate" do
    context 'product is a free tax item' do
      context 'imported product' do
        let(:product_name) { 'Imported Math book' }

        it 'return 0.05' do
          expect(subject.calculate).to eq 0.75
        end
      end

      context 'not imported product' do
        let(:product_name) { 'Math book' }

        it 'return 0' do
          expect(subject.calculate).to eq 0
        end
      end
    end
    
    context 'product is not a free tax item' do
      context 'imported product' do
        let(:product_name) { 'Imported Music CD' }

        it 'return 0.15' do
          expect(subject.calculate).to eq 2.25
        end
      end

      context 'not imported product' do
        let(:product_name) { 'Music CD' }

        it 'return 0.1' do
          expect(subject.calculate).to eq 1.5
        end
      end
    end
  end
end
