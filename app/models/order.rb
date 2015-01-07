require 'optional_attributes'

class Order < ActiveRecord::Base
  include OptionalAttributes

  validates :product, presence: true

  optional :price_cents, :refund_cents, :charge_token

  def self.find(*args)
    o = super

    o.price_cents.map_or(o) { |price_cents|
      o.charge_token.map_or(PlacedOrder.new(o)) { |charge_token|
        o.refund_cents.map_or(ChargedOrder.new(o)) { |refund_cents|
          RefundedOrder.new(o)
        }
      }
    }
  end

  def cell
    :order
  end
end
