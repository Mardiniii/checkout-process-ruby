require_relative '../lib/rules/rules'
require_relative '../lib/order'
require_relative '../lib/product'

RSpec.describe Rules do
  let(:order) { Order.new }
  let(:rules) { described_class.new }

  describe "#apply_rules" do
    before do
      p1 = Product.new("VOUCHER", "Cabify Voucher", 5.00)
      p2 = Product.new("TSHIRT", "Cabify T-Shirt", 20.00)
      order.add_item(p1)
      order.add_item(p1)
      order.add_item(p2)
      order.add_item(p2)
      order.add_item(p2)
      rules.apply_rules(order.items)
    end

    it { expect(order.items["VOUCHER"].discount).to eq(5.0) }
    it { expect(order.items["TSHIRT"].discount).to eq(3.0) }
  end
end
