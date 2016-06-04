require 'test_helper'

class CarbrandsControllerTest < ActionController::TestCase
  setup do
    @carbrand = carbrands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carbrands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carbrand" do
    assert_difference('Carbrand.count') do
      post :create, carbrand: { name: @carbrand.name }
    end

    assert_redirected_to carbrand_path(assigns(:carbrand))
  end

  test "should show carbrand" do
    get :show, id: @carbrand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carbrand
    assert_response :success
  end

  test "should update carbrand" do
    patch :update, id: @carbrand, carbrand: { name: @carbrand.name }
    assert_redirected_to carbrand_path(assigns(:carbrand))
  end

  test "should destroy carbrand" do
    assert_difference('Carbrand.count', -1) do
      delete :destroy, id: @carbrand
    end

    assert_redirected_to carbrands_path
  end
end
