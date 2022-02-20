require 'bigdecimal'

class TaxCalculator
  BASIC_SALES_TAX = BigDecimal('0.1')
  IMPORT_DUTY_SALES_TAX = BigDecimal('0.05')
  ROUNDING_TAX_RULE = 1 / BigDecimal('0.05')

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
    tax_rate += IMPORT_DUTY_SALES_TAX if @product_item.imported?
    tax_rate
  end

  def base_tax_rate
    @product_item.exempted? ? 0 : BASIC_SALES_TAX
  end
end
