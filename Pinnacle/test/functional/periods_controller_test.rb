require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, period: { moneyline_maximum: @period.moneyline_maximum, period_cutoff_datetimeGMT: @period.period_cutoff_datetimeGMT, period_description: @period.period_description, period_number: @period.period_number, period_status: @period.period_status, period_update: @period.period_update, spread_maximum: @period.spread_maximum, total_maximum: @period.total_maximum }
    end

    assert_redirected_to period_path(assigns(:period))
  end

  test "should show period" do
    get :show, id: @period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @period
    assert_response :success
  end

  test "should update period" do
    put :update, id: @period, period: { moneyline_maximum: @period.moneyline_maximum, period_cutoff_datetimeGMT: @period.period_cutoff_datetimeGMT, period_description: @period.period_description, period_number: @period.period_number, period_status: @period.period_status, period_update: @period.period_update, spread_maximum: @period.spread_maximum, total_maximum: @period.total_maximum }
    assert_redirected_to period_path(assigns(:period))
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete :destroy, id: @period
    end

    assert_redirected_to periods_path
  end
end
