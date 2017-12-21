require_relative 'product'

class Store
  attr_reader :products

  def initialize
    @products = {}
  end

  def add_product(code, name, price)
    products[code] = Product.new(code, name, price)
  end
end
