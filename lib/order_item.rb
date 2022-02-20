require_relative 'product'
require_relative 'tax_calculator'

class OrderItem
  attr_accessor :sales_taxes, :total

  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity
    @sales_taxes = total_sales_taxes
    @total = (@quantity * @product.price) + @sales_taxes
  end

  def calculate_order_item
    [
      @quantity,
      @product.name,
      @total.to_f.round(2)
    ]
  end

  private

  def tax_calculator
    @tax_calculator ||= TaxCalculator.new(product_item: @product)
  end

  def product_tax
    tax_calculator.calculate
  end

  def total_sales_taxes
    @quantity * product_tax
  end
end
