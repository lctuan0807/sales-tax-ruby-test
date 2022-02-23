class LineItem
  attr_accessor :item_tax, :quantity, :product

  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity
    @item_tax = tax
  end

  def tax
    @quantity * @product.sales_tax
  end

  def cost
    @quantity * (@item_tax + @product.price)
  end

  def display
    "#{@quantity}, #{@product.name}, #{cost.to_f.round(2)}"
  end
end
