class PlacedOrderCell < OrderCell
  def show
    render
  end

  private

  def status
    render view: :status
  end
end
