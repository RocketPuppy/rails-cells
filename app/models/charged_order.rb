class ChargedOrder < ActiveRecord::Base
  include OptionalAttributes
  include WhiteListAttributes

  self.table_name = 'orders'

  default_scope -> { where.not(price_cents: nil, product: nil, charge_code: nil).where(refunded_cents: nil) }

  validates :product, :price_cents, :charge_code, presence: true
  validates :refunded_cents, presence: false

  white_list :id, :product, :price_cents, :charge_code, :created_at

  def refund!(amount)
    o = becomes(RefundedOrder)
    o.refunded_cents = amount
    o.save!
    o
  end

  def cell
    :charged_order
  end
end
