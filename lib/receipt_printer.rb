class ReceiptPrinter
  def initialize(receipt:)
    @receipt = receipt
  end

  def print
    print_items
    print_sales_taxes
    print_total
  end

  private

  def print_items
    @receipt.items_with_tax.each { |owt| puts owt.join(', ') }
  end

  def print_sales_taxes
    puts "\nSales Taxes: #{format_money(@receipt.total_sales_taxes)}"
  end

  def print_total
    puts "Total: #{format_money(@receipt.total_cost)}"
  end

  def format_money(money)
    '%.2f' % money.to_f
  end
end
