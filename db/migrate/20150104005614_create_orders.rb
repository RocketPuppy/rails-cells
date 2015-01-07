class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :product
      t.integer :price_cents
      t.integer :refunded_cents
      t.integer :charge_code
      t.timestamps
    end
  end
end
