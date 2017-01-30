class LineItem

  attr_accessor :name, :unit_price, :quantity

  def initialize(name, unit_price, quantity=1)
    @name = name
    @unit_price = unit_price
    @quantity = quantity
  end
end
