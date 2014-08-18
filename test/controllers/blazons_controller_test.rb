require 'test_helper'

class BlazonsControllerTest < ActionController::TestCase
  setup do
    @blazon = blazons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blazons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blazon" do
    assert_difference('Blazon.count') do
      post :create, blazon: {  }
    end

    assert_redirected_to blazon_path(assigns(:blazon))
  end

  test "should show blazon" do
    get :show, id: @blazon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blazon
    assert_response :success
  end

  test "should update blazon" do
    patch :update, id: @blazon, blazon: {  }
    assert_redirected_to blazon_path(assigns(:blazon))
  end

  test "should destroy blazon" do
    assert_difference('Blazon.count', -1) do
      delete :destroy, id: @blazon
    end

    assert_redirected_to blazons_path
  end
end
