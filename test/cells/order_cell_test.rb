require 'test_helper'

class OrderCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
