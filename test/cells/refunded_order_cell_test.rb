require 'test_helper'

class RefundedOrderCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
