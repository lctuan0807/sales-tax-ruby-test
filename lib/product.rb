class Product
  TAX_EXCEMPT_PRODUCT = %i(book food medicine)

  attr_accessor :name, :price
  attr_reader :category

  def initialize(name:, price:)
    @name = name
    @price = price
    @category = build_category
  end

  def imported?
    @name.downcase.include?('imported')
  end

  def tax_exempted?
    TAX_EXCEMPT_PRODUCT.include?(category)
  end

  private

  def build_category
    return :book if @name.downcase.include?('book')
    return :food if @name.downcase.include?('chocolate')
    return :medicine if @name.downcase.include?('pill')
    :other
  end
end
