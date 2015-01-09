class OrderController < ApplicationController
  def show
    order = Order.lookup(params[:id])

    render locals: { order: order }
  end

  def place
    order = PlacedOrder.create!(params[:order])

    render locals: { order: order }
  end

  def charge
    order = PlacedOrder.find(params[:id])

    render locals: { order: order.charge! }
  end
end
