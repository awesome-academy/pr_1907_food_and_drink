require "test_helper"

class ProductOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_orders_index_url
    assert_response :success
  end

end
