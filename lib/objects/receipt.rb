class Receipt
  attr_accessor :items

  def initialize(items: [])
    @items = items
  end

  def add_item(item)
    items << item
  end

  def total_sales_tax
    items.map(&:tax).sum
  end

  def total_cost
    items.map(&:total_cost).sum
  end
end
