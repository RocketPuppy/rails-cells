class ChargedOrder
  delegate :id, :product, :price_cents, :charge_token, to: :order

  def initialize(order)
    @order = order
  end

  def cell
    :charged_order
  end

  private

  attr_reader :order
end
