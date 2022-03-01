class Product
  attr_accessor :name, :price
  attr_reader :category

  def initialize(name:, price:)
    @name = name
    @price = price.to_f
    @category = build_category
  end

  def imported?
    @name.downcase.include?('imported')
  end

  private

  def build_category
    return :book if @name.downcase.include?('book')
    return :food if @name.downcase.include?('chocolate')
    return :medicine if @name.downcase.include?('pill')
    :other
  end 
end
