require "test_helper"

class SearchdoctorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get searchdoctor_index_url
    assert_response :success
  end
end
