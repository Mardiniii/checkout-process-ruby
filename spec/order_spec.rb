require_relative '../lib/order'
require_relative '../lib/product'

RSpec.describe Order do
  describe '#add_item' do
    before do
      @order = described_class.new
      product1 = Product.new("product1", "name-product1", 99.99)
      product2 = Product.new("product2", "name-product2", 33.33)
      @order.add_item(product1)
      @order.add_item(product1)
      @order.add_item(product2)
      @first_item = @order.items.first[1]
    end

    it { expect(@order.items.length).to eq(2) }
    it { expect(@first_item.code).to eq("product1") }
    it { expect(@first_item.quantity).to eq(2) }
    it { expect(@first_item.unit_price).to eq(99.99) }
  end
end
