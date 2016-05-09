require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid" do
    assert_difference('Bid.count') do
      post :create, bid: { cangodrive: @bid.cangodrive, come_back: @bid.come_back, driver_id: @bid.driver_id, go_at: @bid.go_at, pass1_id: @bid.pass1_id, pass2_id: @bid.pass2_id, pass3_id: @bid.pass3_id, pass4_id: @bid.pass4_id, shop_id: @bid.shop_id }
    end

    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should show bid" do
    get :show, id: @bid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid
    assert_response :success
  end

  test "should update bid" do
    patch :update, id: @bid, bid: { cangodrive: @bid.cangodrive, come_back: @bid.come_back, driver_id: @bid.driver_id, go_at: @bid.go_at, pass1_id: @bid.pass1_id, pass2_id: @bid.pass2_id, pass3_id: @bid.pass3_id, pass4_id: @bid.pass4_id, shop_id: @bid.shop_id }
    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should destroy bid" do
    assert_difference('Bid.count', -1) do
      delete :destroy, id: @bid
    end

    assert_redirected_to bids_path
  end
end
