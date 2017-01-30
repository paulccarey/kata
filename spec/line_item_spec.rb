require 'spec_helper'

describe LineItem do

  describe '.new' do

    it 'assigns values based during initialize/setup' do
      item = LineItem.new('A', 10, 3)
      expect(item.name).to eq('A')
      expect(item.unit_price).to eq(10)
      expect(item.quantity).to eq(3)
    end

    it 'default quantity to 1' do
      item = LineItem.new('A', 10)
      expect(item.quantity).to eq(1)
    end
  end
end
