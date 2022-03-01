require 'bigdecimal'
require_relative '../helpers/utility'

class TaxCalculator
  EXCEMPTED_TAX_ITEM = %i(book food medicine)
  NONE_TAX = BigDecimal('0.0')
  IMPORTED_TAX = BigDecimal('0.05')
  BASIC_TAX = BigDecimal('0.1')
  ROUNDING_TAX_RULE = 1 / 0.05

  include Utility

  def initialize(item:)
    @item = item
  end

  def calculate
    round_nearest(item_tax, ROUNDING_TAX_RULE)
  end

  private

  def item_tax
    @item.price * rate_tax
  end

  def rate_tax
    rate_tax = base_tax
    rate_tax += IMPORTED_TAX if @item.imported?
    rate_tax
  end

  def base_tax
    EXCEMPTED_TAX_ITEM.include?(@item.category) ? NONE_TAX : BASIC_TAX
  end
end
