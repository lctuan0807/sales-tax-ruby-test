require_relative 'order_item'

class Receipt
  attr_reader :orders_with_tax, :sales_taxes, :total_cost

  def initialize(items: [])
    @items = items
    @orders_with_tax = []
    @total_cost = 0
    @sales_taxes = 0
  end

  def add_item(item)
    @items << item
  end

  def calculate
    @items.each do |item|
      product = Product.new(name: item[1], price: item[2].to_f)
      order_item = OrderItem.new(product: product, quantity: item[0].to_i)
    
      @orders_with_tax.push(order_item.calculate_order_item)
      @total_cost += order_item.total
      @sales_taxes += order_item.sales_taxes
    end
  end
end
