class Receipt
  attr_accessor :total_sales_tax, :total_cost, :line_items

  def initialize(line_items: [])
    @line_items = line_items
    @total_sales_tax = 0.0
    @total_cost = 0.0
  end

  def add_item(item)
    line_items << item
  end

  def total_sales_tax
    total_sales_tax = line_items.map(&:item_tax).sum
  end

  def total_cost
    total_cost = line_items.map(&:cost).sum
  end
end
