require_relative './lib/application.rb'

Dir.glob(File.join("input_data", "*.csv")).sort.each do |file|
  application = Application.new(file: file)
  application.execute
end
