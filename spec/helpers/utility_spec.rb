require_relative '../spec_helper'

module Utility
  def self.format_money(money)
    money.to_f.round(2)
  end

  def self.round_nearest(number, nearest_rule)
    (number * nearest_rule).ceil / nearest_rule
  end
end

RSpec.describe Helpers::Utility do
  describe ".format_money" do
    let(:money) { '13.4444' }

    it 'return money rounded to 2 digit' do
      expect(Utility.format_money(money)).to eq 13.44
    end
  end
  
  describe ".round_nearest" do
    let(:number) { 14.1234 }
    let(:nearest_rule) { 1 / 0.05 }

    it 'return money rounded nearest to rule' do
      expect(Utility.round_nearest(number, nearest_rule)).to eq 14.15
    end
  end
end
