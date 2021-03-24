require "test_helper"

class MydoctorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mydoctor_index_url
    assert_response :success
  end
end
