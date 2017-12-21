require_relative '../lib/rules/bulk_purchases_rule'
require_relative '../lib/order_item'

RSpec.describe BulkPurchasesRule do
  let(:item) { OrderItem.new("TSHIRT", 20.0) }

  describe "#apply" do
    context "with 3 or more units get 5% discount" do
      before do
        rule = described_class.new("TSHIRT", 3, 5)
        allow(item).to receive(:quantity).and_return(4)
        rule.apply(item)
        @unit_price_with_discount = item.unit_price - (item.discount / item.quantity)
      end

      it { expect(item.discount).to eq(4) }
      it { expect(@unit_price_with_discount).to eq(19) }
    end

    context "with 4 or more units get 10% discount" do
      before do
        rule = described_class.new("TSHIRT", 4, 10)
        allow(item).to receive(:quantity).and_return(4)
        rule.apply(item)
        @unit_price_with_discount = item.unit_price - (item.discount / item.quantity)
      end

      it { expect(item.discount).to eq(8) }
      it { expect(@unit_price_with_discount).to eq(18) }
    end
  end
end
