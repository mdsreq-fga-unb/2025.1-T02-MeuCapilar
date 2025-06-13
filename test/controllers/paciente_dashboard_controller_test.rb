require "test_helper"

class PacienteDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paciente_dashboard_index_url
    assert_response :success
  end
end
