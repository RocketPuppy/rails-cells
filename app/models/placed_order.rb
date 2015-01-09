class PlacedOrder < ActiveRecord::Base
  include WhiteListAttributes

  self.table_name = 'orders'

  default_scope -> { where.not(price_cents: nil, product: nil).where(charge_code: nil, refunded_cents: nil) }

  validates :product, :price_cents, presence: true
  validates :charge_code, :refunded_cents, presence: false

  white_list :id, :product, :price_cents, :created_at

  def charge!
    o = becomes(ChargedOrder)
    o.charge_code = SecureRandom.hex
    o.save!
    o
  end

  def cell
    :placed_order
  end
end
