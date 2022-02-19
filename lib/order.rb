require_relative 'product'

class Order
  attr_accessor :sales_taxes, :total

  ROUNDING_TAX_RULE = 1 / 0.05

  def initialize(order:)
    @product = Product.new(name: order[1], price: order[2].to_f)
    @quantity = order[0].to_i
    @price = @product.price
    @sales_taxes = total_sales_taxes
    @total = @quantity * @price + @sales_taxes
  end

  def order_with_tax
    [
      @quantity,
      @product.name,
      @total.to_f.round(2)
    ]
  end

  private

  def total_sales_taxes
    # puts "Item tax: #{item_tax}"
    # puts "Round tax: #{round_tax(item_tax)}"
    round_tax(item_tax)
  end

  def item_tax
    @quantity * @price * @product.tax_rate
  end

  def round_tax(tax)
    (tax * ROUNDING_TAX_RULE).ceil / ROUNDING_TAX_RULE
  end
end
