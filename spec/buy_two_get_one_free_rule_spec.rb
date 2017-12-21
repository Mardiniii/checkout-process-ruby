require_relative '../lib/rules/buy_two_get_one_free_rule'
require_relative '../lib/order_item'

RSpec.describe BuyTwoGetOneFreeRule do
  describe "#apply" do
    let(:item) { OrderItem.new("VOUCHER", 20.0) }
    let(:rule) { described_class.new("VOUCHER") }

    context "discount when quantity is pair" do
      before do
        allow(item).to receive(:quantity).and_return(2)
        rule.apply(item)
      end

      it { expect(item.discount).to eq(20.0) }
    end

    context "discount when quantity is odd" do
      before do
        allow(item).to receive(:quantity).and_return(5)
        rule.apply(item)
      end

      it { expect(item.discount).to eq(40.0) }
    end
  end
end
