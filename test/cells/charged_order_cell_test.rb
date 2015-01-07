require 'test_helper'

class ChargedOrderCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
