require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescription = prescriptions(:one)
  end

  test "should get index" do
    get prescriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_prescription_url
    assert_response :success
  end

  test "should create prescription" do
    assert_difference('Prescription.count') do
      post prescriptions_url, params: { prescription: { description: @prescription.description, doctor_id: @prescription.doctor_id, prescription_id: @prescription.prescription_id, title: @prescription.title, user_id: @prescription.user_id } }
    end

    assert_redirected_to prescription_url(Prescription.last)
  end

  test "should show prescription" do
    get prescription_url(@prescription)
    assert_response :success
  end

  test "should get edit" do
    get edit_prescription_url(@prescription)
    assert_response :success
  end

  test "should update prescription" do
    patch prescription_url(@prescription), params: { prescription: { description: @prescription.description, doctor_id: @prescription.doctor_id, prescription_id: @prescription.prescription_id, title: @prescription.title, user_id: @prescription.user_id } }
    assert_redirected_to prescription_url(@prescription)
  end

  test "should destroy prescription" do
    assert_difference('Prescription.count', -1) do
      delete prescription_url(@prescription)
    end

    assert_redirected_to prescriptions_url
  end
end
