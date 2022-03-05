require_relative '../services/tax_calculator'

class Item
  attr_accessor :product, :quantity

  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity.to_i
  end

  def tax
    @quantity * product_sales_tax
  end

  def total_cost
    (@quantity * @product.price) + tax
  end

  private

  def product_sales_tax
    TaxCalculator.new(item: product).calculate
  end
end
