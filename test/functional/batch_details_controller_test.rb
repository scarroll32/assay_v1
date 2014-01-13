require 'test_helper'

class BatchDetailsControllerTest < ActionController::TestCase
  setup do
    @batch_detail = batch_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batch_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batch_detail" do
    assert_difference('BatchDetail.count') do
      post :create, batch_detail: { gene: @batch_detail.gene, grch37_start: @batch_detail.grch37_start, grch37_stop: @batch_detail.grch37_stop, status: @batch_detail.status }
    end

    assert_redirected_to batch_detail_path(assigns(:batch_detail))
  end

  test "should show batch_detail" do
    get :show, id: @batch_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batch_detail
    assert_response :success
  end

  test "should update batch_detail" do
    put :update, id: @batch_detail, batch_detail: { gene: @batch_detail.gene, grch37_start: @batch_detail.grch37_start, grch37_stop: @batch_detail.grch37_stop, status: @batch_detail.status }
    assert_redirected_to batch_detail_path(assigns(:batch_detail))
  end

  test "should destroy batch_detail" do
    assert_difference('BatchDetail.count', -1) do
      delete :destroy, id: @batch_detail
    end

    assert_redirected_to batch_details_path
  end
end
