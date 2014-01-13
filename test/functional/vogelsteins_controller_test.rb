require 'test_helper'

class VogelsteinsControllerTest < ActionController::TestCase
  setup do
    @vogelstein = vogelsteins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vogelsteins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vogelstein" do
    assert_difference('Vogelstein.count') do
      post :create, vogelstein: { gene: @vogelstein.gene }
    end

    assert_redirected_to vogelstein_path(assigns(:vogelstein))
  end

  test "should show vogelstein" do
    get :show, id: @vogelstein
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vogelstein
    assert_response :success
  end

  test "should update vogelstein" do
    put :update, id: @vogelstein, vogelstein: { gene: @vogelstein.gene }
    assert_redirected_to vogelstein_path(assigns(:vogelstein))
  end

  test "should destroy vogelstein" do
    assert_difference('Vogelstein.count', -1) do
      delete :destroy, id: @vogelstein
    end

    assert_redirected_to vogelsteins_path
  end
end
