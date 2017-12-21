require_relative 'order_item'

class Order
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_item(product)
    item = OrderItem.new(product.code, product.price)
    items[item.code] ||= item
    items[item.code].quantity += 1
  end
end
