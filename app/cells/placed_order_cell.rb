class PlacedOrderCell < OrderCell
  include ActionView::Helpers::NumberHelper

  def show
    render
  end

  private

  def price
    render view: :price, locals: { price: number_to_currency(model.price_cents / 100.0) }
  end

  def status
    render view: :status
  end
end
