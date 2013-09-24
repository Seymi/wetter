require 'test_helper'

class GeneratesControllerTest < ActionController::TestCase
  setup do
    @generate = generates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generate" do
    assert_difference('Generate.count') do
      post :create, generate: { contestantnum: @generate.contestantnum, event_gamenumber: @generate.event_gamenumber, participant: @generate.participant, participant_name: @generate.participant_name, rotnum: @generate.rotnum, scaffold_controller: @generate.scaffold_controller, visiting_home_draw: @generate.visiting_home_draw }
    end

    assert_redirected_to generate_path(assigns(:generate))
  end

  test "should show generate" do
    get :show, id: @generate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generate
    assert_response :success
  end

  test "should update generate" do
    put :update, id: @generate, generate: { contestantnum: @generate.contestantnum, event_gamenumber: @generate.event_gamenumber, participant: @generate.participant, participant_name: @generate.participant_name, rotnum: @generate.rotnum, scaffold_controller: @generate.scaffold_controller, visiting_home_draw: @generate.visiting_home_draw }
    assert_redirected_to generate_path(assigns(:generate))
  end

  test "should destroy generate" do
    assert_difference('Generate.count', -1) do
      delete :destroy, id: @generate
    end

    assert_redirected_to generates_path
  end
end
