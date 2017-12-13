require 'test_helper'

class RegisteredApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registered_applications_new_url
    assert_response :success
  end

  test "should get edit" do
    get registered_applications_edit_url
    assert_response :success
  end

  test "should get create" do
    get registered_applications_create_url
    assert_response :success
  end

  test "should get update" do
    get registered_applications_update_url
    assert_response :success
  end

  test "should get delete" do
    get registered_applications_delete_url
    assert_response :success
  end

end
