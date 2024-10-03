require "test_helper"

class AlumnosControllerTest < ActionDispatch::IntegrationTest
  test "should get menu_principal" do
    get alumnos_menu_principal_url
    assert_response :success
  end
end
