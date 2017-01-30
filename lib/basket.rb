class Basket

  attr_accessor :items, :promos

  def initialize(promos={})
    @items  = []
    @promos = promos
  end

  def add(item)
    @items << item
  end

  def total
    items.inject(0) do |total_result, item|

      item_promos = promos[item.name]
      promo_cost = item_promos[item.quantity] unless item_promos.nil?

      if promo_cost.nil?
        total_result += (item.unit_price*item.quantity)
      else
        total_result += promo_cost
      end
    end
  end
end
