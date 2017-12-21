class OrderItem
  attr_reader :code
  attr_accessor :quantity, :unit_price, :discount

  def initialize(code, price)
    @code = code
    @unit_price = price
    @quantity = 0
    @discount = 0
  end
end
