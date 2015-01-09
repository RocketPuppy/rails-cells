class RefundedOrderCell < OrderCell
  include ActionView::Helpers::NumberHelper

  def show
    render
  end

  private

  def refunded_amount
    render view: :refunded_amount, locals: { refunded_amount: number_to_currency(model.refunded_cents / 100.0) }
  end

  def charged_amount
    render view: :charged_amount, locals: { charged_amount: number_to_currency(model.price_cents / 100.0) }
  end

  def status
    render view: :status
  end
end
