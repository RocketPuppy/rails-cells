require 'cache_associations'
require 'optional'

class Order < ActiveRecord::Base
  include CacheAssociations

  default_scope -> { eager_load(:placed_order, :charged_order, :refunded_order) }

  has_one :placed_order, foreign_key: 'id'
  has_one :charged_order, foreign_key: 'id'
  has_one :refunded_order, foreign_key: 'id'

  cache_associations :placed_order, :charged_order, :refunded_order

  def self.lookup(id)
    o = find(id)

    [o.placed_order, o.charged_order, o.refunded_order].detect(&:just?)
  end
end
