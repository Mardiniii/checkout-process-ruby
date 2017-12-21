require_relative '../lib/store'
require 'pry'

RSpec.describe Store do
  let!(:store) { Store.new }

  describe "#load_products" do
    before do
      @product = store.products["TSHIRT"]
    end

    it { expect(store.products.length).to eq(3) }
    it { expect(@product.code).to eq("TSHIRT") }
    it { expect(@product.name).to eq("Cabify T-Shirt") }
    it { expect(@product.price).to eq(20.00) }
  end
end
