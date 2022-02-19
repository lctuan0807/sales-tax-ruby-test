require_relative 'order'

class Receipt
  attr_accessor :orders_with_tax, :sales_taxes, :total_price

  def initialize(orders = [])
    @orders = orders
    @orders_with_tax = []
    @total_price = 0
    @sales_taxes = 0
  end

  def calculate
    @orders.each do |order|
      order = Order.new(order: order)
      order_with_tax = order.order_with_tax

      @orders_with_tax.push(order_with_tax)
      @total_price += order.total
      @sales_taxes += order.sales_taxes
    end
  end

  def print
    print_items
    print_sales_taxes
    print_total
  end

  private

  def print_items
    orders_with_tax.each { |owt| puts owt.join(', ') }
  end

  def print_sales_taxes
    puts "\nSales Taxes: #{format_money(@sales_taxes)}"
  end

  def print_total
    puts "Total: #{format_money(@total_price)}"
  end

  def format_money(money)
    sprintf('%.2f', money.to_f)
  end
end
