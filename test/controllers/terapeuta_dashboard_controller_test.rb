require "test_helper"

class TerapeutaDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get terapeuta_dashboard_index_url
    assert_response :success
  end
end
