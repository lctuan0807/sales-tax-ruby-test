require 'csv'
require_relative 'receipt'
require_relative 'receipt_printer'

class Application
  def initialize(file:)
    @file = file
  end

  def execute
    puts @file
    items.each { |item| receipt.add_item(item) }
    receipt.calculate
    receipt_printer.print
  end

  private

  def items
    @items ||= CSV.read(@file)[1..-1]
  end

  def receipt
    @receipt ||= Receipt.new
  end

  def receipt_printer
    @receipt_printer ||= ReceiptPrinter.new(receipt: receipt)
  end
end
