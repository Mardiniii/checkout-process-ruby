require_relative 'buy_two_get_one_free_rule'
require_relative 'bulk_purchases_rule'

class Rules
  attr_reader :pricing_rules

  def initialize
    @pricing_rules = []
    load_rules
  end

  def load_rules
    @pricing_rules << BuyTwoGetOneFreeRule.new("VOUCHER")
    @pricing_rules << BulkPurchasesRule.new("TSHIRT", 3, 5)
  end

  def apply_rules(items)
    items.map do |code, item|
      @pricing_rules.each do |rule|
        code == rule.code ? rule.apply(item) : next
      end
    end
  end
end
