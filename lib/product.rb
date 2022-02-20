class Product
  TAX_EXCEMPT_PRODUCT = %w(book chocolate pill)

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

  def exempted?
    [:food, :book, :medicine].include?(category)
  end

  private

  def build_category
    return :book if @name.downcase.include?('book')
    return :food if @name.downcase.include?('chocolate')
    return :medicine if @name.downcase.include?('pill')
  end
end
