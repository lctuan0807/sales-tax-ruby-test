module Helper
  def self.format_money(money)
    sprintf('%.2f', money.to_f)
  end
end