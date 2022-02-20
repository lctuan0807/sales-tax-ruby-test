require_relative '../lib/application.rb'

RSpec.describe Application do
  let(:file_name) { File.join('..', 'input_data', 'input1.csv') }
  let(:application) { Application.new(file_name: file_name) }

  describe "#new" do
    it "takes file name and returns a Application object" do
      expect(application).to be_an_instance_of Application
    end
  end

  describe "#execute" do
    let(:data) { "title\tsurname\tfirstname\rtitle2\tsurname2\tfirstname2\r" }

    it "display receipt info" do
      # expect(File).to receive(:open).with(file_name, "r", {:universal_newline=>false}) { StringIO.new(data) }
      expect(CSV).to receive(:read).with(file_name)
      expect(application.execute).to eq ''
    end
  end
end
