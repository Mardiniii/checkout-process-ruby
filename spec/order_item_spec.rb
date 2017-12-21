require_relative '../lib/order_item'

RSpec.describe OrderItem do
  before do
    @order_item = described_class.new("code-product", 99.99)
  end

  it { expect(@order_item.code).to eq("code-product") }
  it { expect(@order_item.unit_price).to eq(99.99) }
end
