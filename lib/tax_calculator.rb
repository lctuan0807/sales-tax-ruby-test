require 'bigdecimal'

class TaxCalculator
  BASIC_TAX = 0.1
  IMPORTED_TAX = 0.05
  ROUNDING_TAX_RULE = 1 / 0.05

  def initialize(product_item:)
    @product_item = product_item
  end

  def calculate
    (product_tax * ROUNDING_TAX_RULE).ceil / ROUNDING_TAX_RULE
  end

  private

  def product_tax
    @product_item.price * tax_rate
  end

  def tax_rate
    tax_rate = base_tax_rate
    tax_rate += IMPORTED_TAX if @product_item.imported?
    tax_rate
  end

  def base_tax_rate
    @product_item.tax_exempted? ? 0 : BASIC_TAX
  end
end
