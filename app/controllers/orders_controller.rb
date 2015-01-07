class OrderController < ApplicationController
  def show
    order = Order.find(params[:id])

    binding.pry

    order.render
  end
end
