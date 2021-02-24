require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get dashboards_update_url
    assert_response :success
  end

  test "should get create" do
    get dashboards_create_url
    assert_response :success
  end
end
