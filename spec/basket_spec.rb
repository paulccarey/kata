require 'spec_helper'

describe Basket do


  describe '#add' do

    context 'no items exist' do

      it 'creates a new list of items and adds the item we pass in' do
        basket = Basket.new

        expect(basket.items).to be_empty

        basket.add(:item)

        expect(basket.items).to contain_exactly(:item)
      end
    end

    context 'when items already exist' do

      it 'adds the new item but it doesnt remove the old items' do
        basket = Basket.new

        basket.items = [:item_1]

        basket.add(:item_2)

        expect(basket.items).to contain_exactly(:item_1, :item_2)
      end
    end
  end

  describe '#total' do

    let(:basket) { Basket.new }

    before(:each) do
      items.each do |item|
        basket.add(item)
      end
    end

    context 'empty basket' do

      let(:items) { [] }

      it 'returns a value of zero' do
        expect(basket.total).to eq(0)
      end
    end

    context 'basket has one item' do

      let(:items) { [LineItem.new('A', 10)] }

      it 'returns a value of 10 for the single item' do
        expect(basket.total).to eq(10)
      end
    end

    context 'basket has two items' do

      let(:items) { [LineItem.new('A', 10), LineItem.new('B', 20)] }

      it 'returns a value of 30 for the two different items' do
        expect(basket.total).to eq(30)
      end
    end

    context 'basket has multiple quantities of items' do

      let(:items) { [LineItem.new('A', 10, 3), LineItem.new('B', 20, 3)] }

      it 'calculates totals inclusive of quantities' do
        expect(basket.total).to eq(90)
      end
    end

    context 'promos' do

      let(:basket) { Basket.new(promos) }

      let(:promos) do
        {
            'A' => { 3 => 25 }
        }
      end

      let(:items) { [LineItem.new('A', 10, 3)] }

      it 'returns total with the offer applied' do
        expect(basket.total).to eq(25)
      end
    end
  end
end
