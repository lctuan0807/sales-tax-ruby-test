require 'csv'
require_relative 'receipt'

class Main
  def initialize(file_name:)
    @file_name = file_name
  end

  def execute
    return if @file_name.nil?
    orders = CSV.read(@file_name)[1..-1]
    receipt = Receipt.new(orders)
    receipt.calculate
    receipt.print
  end
end

input_file_name = ARGV.first
export_order = Main.new(file_name: input_file_name)
export_order.execute

