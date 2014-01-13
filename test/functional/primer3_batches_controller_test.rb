require 'test_helper'

class Primer3BatchesControllerTest < ActionController::TestCase
  setup do
    @primer3_batch = primer3_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primer3_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primer3_batch" do
    assert_difference('Primer3Batch.count') do
      post :create, primer3_batch: { excluded_region: @primer3_batch.excluded_region, explain_flag: @primer3_batch.explain_flag, max_unknown_bases: @primer3_batch.max_unknown_bases, pick_internal_oligo: @primer3_batch.pick_internal_oligo, pick_left: @primer3_batch.pick_left, pick_right: @primer3_batch.pick_right, product_size_range: @primer3_batch.product_size_range, seq_identifier: @primer3_batch.seq_identifier, seq_target: @primer3_batch.seq_target, seq_template: @primer3_batch.seq_template, size_max: @primer3_batch.size_max, size_min: @primer3_batch.size_min, size_opt: @primer3_batch.size_opt, task: @primer3_batch.task }
    end

    assert_redirected_to primer3_batch_path(assigns(:primer3_batch))
  end

  test "should show primer3_batch" do
    get :show, id: @primer3_batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primer3_batch
    assert_response :success
  end

  test "should update primer3_batch" do
    put :update, id: @primer3_batch, primer3_batch: { excluded_region: @primer3_batch.excluded_region, explain_flag: @primer3_batch.explain_flag, max_unknown_bases: @primer3_batch.max_unknown_bases, pick_internal_oligo: @primer3_batch.pick_internal_oligo, pick_left: @primer3_batch.pick_left, pick_right: @primer3_batch.pick_right, product_size_range: @primer3_batch.product_size_range, seq_identifier: @primer3_batch.seq_identifier, seq_target: @primer3_batch.seq_target, seq_template: @primer3_batch.seq_template, size_max: @primer3_batch.size_max, size_min: @primer3_batch.size_min, size_opt: @primer3_batch.size_opt, task: @primer3_batch.task }
    assert_redirected_to primer3_batch_path(assigns(:primer3_batch))
  end

  test "should destroy primer3_batch" do
    assert_difference('Primer3Batch.count', -1) do
      delete :destroy, id: @primer3_batch
    end

    assert_redirected_to primer3_batches_path
  end
end
