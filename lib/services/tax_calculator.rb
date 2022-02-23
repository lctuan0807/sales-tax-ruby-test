require 'bigdecimal'

class TaxCalculator
  TAX_EXCEMPT = %i(book food medicine)
  NONE_TAX = BigDecimal('0.0')
  IMPORTED_TAX = BigDecimal('0.05')
  BASIC_TAX = BigDecimal('0.1')
  ROUNDING_TAX_RULE = 1 / 0.05

  def initialize(item:)
    @item = item
  end

  def calculate
    (item_tax * ROUNDING_TAX_RULE).ceil / ROUNDING_TAX_RULE
  end

  private

  def item_tax
    @item.price * rate_tax
  end

  def rate_tax
    rate_tax = base_tax
    rate_tax += IMPORTED_TAX if @item.is_imported
    rate_tax
  end

  def base_tax
    TAX_EXCEMPT.include?(@item.category) ? NONE_TAX : BASIC_TAX
  end
end
