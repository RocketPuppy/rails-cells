class OrderController < ApplicationController
  def show
    order = Order.lookup(params[:id])

    render locals: { order: order }
  end
end
