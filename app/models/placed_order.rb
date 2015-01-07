class PlacedOrder
  delegate :id, :product, :price_cents, :created_at, to: :order

  def initialize(order)
    @order = order
  end

  def cell
    :placed_order
  end

  private

  attr_reader :order
end
