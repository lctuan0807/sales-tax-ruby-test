class Product
  FREE_TAX_PRODUCTS = %w(book chocolate pill)
  BASIC_SALES_TAX = 0.1
  IMPORT_DUTY_SALES_TAX = 0.05

  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def tax_rate
    tax = base_tax_rate
    tax += IMPORT_DUTY_SALES_TAX if imported?
    tax
  end

  private

  def base_tax_rate
    free_tax? ? 0 : BASIC_SALES_TAX
  end

  def imported?
    @name.downcase.include?('imported')
  end

  def free_tax?
    FREE_TAX_PRODUCTS.any? { |free_tax_product| @name.downcase.include?(free_tax_product) }
  end
end
