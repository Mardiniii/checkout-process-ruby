require_relative 'store'
require_relative 'order'
require_relative 'rules/rules'

class Checkout
  attr_reader :order, :store

  def initialize(pricing_rules)
    @rules = pricing_rules
    @store = Store.new
    @order = Order.new
  end

  def scan(code)
    product = @store.products[code]
    if product
      @order.add_item(product)
      total
      "Product scanned"
    else
      "Product doesn't exist, try another code"
    end
  end

  def total
    @total = 0.00
    @discount = 0.00
    @rules.apply_rules(@order.items)
    @order.items.each do |_key, item|
      @total += (item.unit_price * item.quantity - item.discount).round(2)
      @discount += item.discount
    end
    @total
  end

  def show_discount
    total
    puts "got a discount of #{@discount}€ then " if @discount.positive?
  end

  def list_products
    store.products.each { |k, v| puts "Product: #{v.name}  code: #{k} price: #{v.price}€" }
  end

  def list_order_items
    if order.items.length.positive?
      puts "You have scanned:"
      order.items.each { |k, v| puts "#{v.quantity} #{k} units each for #{v.unit_price}€" }
    else
      puts "You don't have scanned products"
    end
  end
end
