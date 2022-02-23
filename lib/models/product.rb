require_relative '../services/tax_calculator'

class Product
  attr_accessor :name, :price, :category, :sales_tax, :is_imported

  def initialize(name:, price:)
    @name = name
    @price = price
    @category = build_category
    @is_imported = imported?
    @sales_tax = TaxCalculator.new(item: self).calculate
  end

  def imported?
    @name.downcase.include?('imported')
  end

  private

  def build_category
    return :book if @name.downcase.include?('book')
    return :food if @name.downcase.include?('chocolate')
    return :medicine if @name.downcase.include?('pill')
    :other
  end 
end
