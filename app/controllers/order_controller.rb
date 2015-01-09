class OrderController < ApplicationController
  def show
    order = [PlacedOrder.find_by(id: params[:id]), ChargedOrder.find_by(id: params[:id]), RefundedOrder.find_by(id: params[:id])].detect(&:present?)

    render locals: { order: order }
  end
end
