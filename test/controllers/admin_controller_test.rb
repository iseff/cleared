require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get landing_page" do
    get admin_landing_page_url
    assert_response :success
  end

  test "should get form_page" do
    get admin_form_page_url
    assert_response :success
  end

  test "should get form" do
    get admin_form_url
    assert_response :success
  end

end
