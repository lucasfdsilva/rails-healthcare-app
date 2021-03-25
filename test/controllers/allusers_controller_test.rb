require "test_helper"

class AllusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get allusers_index_url
    assert_response :success
  end
end
