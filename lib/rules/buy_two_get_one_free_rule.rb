class BuyTwoGetOneFreeRule
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def apply(item)
    item.discount = item.unit_price * (item.quantity / 2) if item.quantity >= 2
  end
end
