module Helpers
  module Utility
    def format_money(money)
      money.to_f.round(2)
    end

    def round_nearest(number, nearest_rule)
      (number * nearest_rule).ceil / nearest_rule
    end
  end
end
