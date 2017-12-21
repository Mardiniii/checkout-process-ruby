require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:co) { described_class.new }

  describe "#scan" do
    before do
      co
    end
    it { expect(co.scan("TSHIRT")).to eq("Product scanned") }
    it { expect(co.scan("WRONG")).to eq("Product doesn't exist, try another code") }
  end

  describe "#total" do
    context "example 1" do
      before do
        co
        co.scan("VOUCHER")
        co.scan("TSHIRT")
        co.scan("MUG")
      end

      it { expect(co.total).to eq(32.5) }
    end
  end
end
