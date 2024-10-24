require "test_helper"

class EvaluacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluaciones_index_url
    assert_response :success
  end

  test "should get new" do
    get evaluaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get evaluaciones_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluaciones_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluaciones_update_url
    assert_response :success
  end

  test "should get show" do
    get evaluaciones_show_url
    assert_response :success
  end

  test "should get calificar" do
    get evaluaciones_calificar_url
    assert_response :success
  end
end
