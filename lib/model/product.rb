class Product
  attr_accessor :name, :price
  attr_reader :category

  EXCEMPT_TAX_ITEMS = %w(book chocolate pill)

  def initialize(name:, price:)
    @name = name
    @price = price.to_f
  end

  def imported?
    @name.downcase.include?('imported')
  end

  def exempt?
    EXCEMPT_TAX_ITEMS.any? { |excemp_item| @name.downcase.include?(excemp_item) }
  end
end
