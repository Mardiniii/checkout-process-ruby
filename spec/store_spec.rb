require_relative '../lib/store'
require 'pry'

RSpec.describe Store do
  let!(:store) { Store.new }

  describe "#add_product" do
    before do
      store.add_product("VOUCHER", "Cabify Voucher", 5.0)
      @product = store.products["VOUCHER"]
    end

    it { expect(store.products.length).to eq(1) }
    it { expect(@product.code).to eq("VOUCHER") }
    it { expect(@product.name).to eq("Cabify Voucher") }
    it { expect(@product.price).to eq(5.0) }
  end
end
