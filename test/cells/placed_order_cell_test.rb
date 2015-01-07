require 'test_helper'

class PlacedOrderCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
