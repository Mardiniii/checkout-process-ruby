require_relative 'product'

class Store
  attr_reader :products

  def initialize
    @products = {}
    load_products
  end

  private

  def load_products
    add_product("VOUCHER", "Cabify Voucher", 5.00)
    add_product("TSHIRT", "Cabify T-Shirt", 20.00)
    add_product("MUG", "Cabify Coffe Mug", 7.50)
  end

  def add_product(code, name, price)
    products[code] = Product.new(code, name, price)
  end
end
