require 'test_helper'

class Primer3SettingsControllerTest < ActionController::TestCase
  setup do
    @primer3_setting = primer3_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primer3_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primer3_setting" do
    assert_difference('Primer3Setting.count') do
      post :create, primer3_setting: { description: @primer3_setting.description, details: @primer3_setting.details, user_id: @primer3_setting.user_id }
    end

    assert_redirected_to primer3_setting_path(assigns(:primer3_setting))
  end

  test "should show primer3_setting" do
    get :show, id: @primer3_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primer3_setting
    assert_response :success
  end

  test "should update primer3_setting" do
    put :update, id: @primer3_setting, primer3_setting: { description: @primer3_setting.description, details: @primer3_setting.details, user_id: @primer3_setting.user_id }
    assert_redirected_to primer3_setting_path(assigns(:primer3_setting))
  end

  test "should destroy primer3_setting" do
    assert_difference('Primer3Setting.count', -1) do
      delete :destroy, id: @primer3_setting
    end

    assert_redirected_to primer3_settings_path
  end
end
