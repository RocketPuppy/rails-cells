class RefundedOrder
  delegate :id, :price_cents, :refund_cents, to: :order

  def initialize(order)
    @order = order
  end

  def cell
    :refunded_order
  end

  private

  attr_reader :order
end
