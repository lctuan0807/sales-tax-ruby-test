require_relative './lib/application'

input_file = ARGV.first
application = Application.new(file: input_file)
application.execute
