class ChargedOrderCell < OrderCell
  include ActionView::Helpers::NumberHelper

  def show
    render
  end

  private

  def charged_amount
    render view: :charged_amount, locals: { charged_amount: number_to_currency(model.price_cents / 100.0) }
  end

  def status
    render view: :status
  end
end
