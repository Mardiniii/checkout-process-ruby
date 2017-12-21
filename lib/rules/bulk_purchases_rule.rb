class BulkPurchasesRule
  attr_reader :code

  def initialize(code, quantity, discount_rate)
    @code = code
    @quantity = quantity
    @discount_rate = discount_rate.to_f / 100
  end

  def apply(item)
    if item.quantity >= @quantity
      item.discount = item.quantity * item.unit_price * @discount_rate
    end
  end
end
