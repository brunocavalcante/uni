require 'test_helper'

class CadeirasControllerTest < ActionController::TestCase
  setup do
    @cadeira = cadeiras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cadeiras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cadeira" do
    assert_difference('Cadeira.count') do
      post :create, :cadeira => @cadeira.attributes
    end

    assert_redirected_to cadeira_path(assigns(:cadeira))
  end

  test "should show cadeira" do
    get :show, :id => @cadeira.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cadeira.to_param
    assert_response :success
  end

  test "should update cadeira" do
    put :update, :id => @cadeira.to_param, :cadeira => @cadeira.attributes
    assert_redirected_to cadeira_path(assigns(:cadeira))
  end

  test "should destroy cadeira" do
    assert_difference('Cadeira.count', -1) do
      delete :destroy, :id => @cadeira.to_param
    end

    assert_redirected_to cadeiras_path
  end
end
