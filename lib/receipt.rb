require_relative 'receipt_item'

class Receipt
  attr_reader :items_with_tax, :total_sales_taxes, :total_cost

  def initialize(items: [])
    @items = items
    @items_with_tax = []
    @total_cost = 0
    @total_sales_taxes = 0
  end

  def add_item(item)
    @items << item
  end

  def calculate
    @items.each do |item|
      product = Product.new(name: item[1], price: item[2].to_f)
      receipt_item = ReceiptItem.new(product: product, quantity: item[0].to_i)
    
      @items_with_tax.push(receipt_item.calculate_order_item)
      @total_cost += receipt_item.total
      @total_sales_taxes += receipt_item.sales_taxes
    end
  end
end
