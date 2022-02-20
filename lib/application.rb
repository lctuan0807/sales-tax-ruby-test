require 'csv'
require_relative 'receipt'
require_relative 'receipt_printer'

class Application
  def initialize(file_name:)
    @file_name = file_name
  end

  def execute
    return if @file_name.nil?
    
    items.each { |item| receipt.add_item(item) }
    receipt.calculate
    receipt_printer.print
  end

  private

  def items
    @items ||= CSV.read(@file_name)[1..-1]
  end

  def receipt
    @receipt ||= Receipt.new
  end

  def receipt_printer
    @receipt_printer ||= ReceiptPrinter.new(receipt: receipt)
  end
end

input_file_name = ARGV.first
application = Application.new(file_name: input_file_name)
application.execute

