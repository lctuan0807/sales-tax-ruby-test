require_relative '../lib/application.rb'

RSpec.describe Application do
  let(file_name)
  let(:application) { Application.new(file_name) }
  describe "#new" do
    it "takes file name and returns a Application object" do
      expect(product).to be_an_instance_of Application
    end
  end
end
