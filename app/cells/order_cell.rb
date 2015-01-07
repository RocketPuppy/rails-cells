class OrderCell < Cell::ViewModel
  def show
    render
  end

  def header
    render view: 'header', locals: {
      id: model.id,
    }
  end

  def details
    render view: 'details', locals: {
      product: model.product.humanize,
      placed_on: model.created_at.to_formatted_s(:short)
    }
  end
end
