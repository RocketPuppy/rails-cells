class RefundedOrder < ActiveRecord::Base
  include OptionalAttributes
  include WhiteListAttributes

  self.table_name = 'orders'

  default_scope -> { where.not(price_cents: nil, product: nil, charge_code: nil, refunded_cents: nil) }

  validates :product, :price_cents, :charge_code, :refunded_cents, presence: true

  white_list :id, :product, :price_cents, :charge_code, :refunded_cents, :created_at

  def cell
    :refunded_order
  end
end
