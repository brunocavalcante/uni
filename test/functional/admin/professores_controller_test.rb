require 'test_helper'

class Admin::ProfessoresControllerTest < ActionController::TestCase
  setup do
    @admin_professore = admin_professores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_professores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_professore" do
    assert_difference('Admin::Professor.count') do
      post :create, :admin_professore => @admin_professore.attributes
    end

    assert_redirected_to admin_professore_path(assigns(:admin_professore))
  end

  test "should show admin_professore" do
    get :show, :id => @admin_professore.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_professore.to_param
    assert_response :success
  end

  test "should update admin_professore" do
    put :update, :id => @admin_professore.to_param, :admin_professore => @admin_professore.attributes
    assert_redirected_to admin_professore_path(assigns(:admin_professore))
  end

  test "should destroy admin_professore" do
    assert_difference('Admin::Professor.count', -1) do
      delete :destroy, :id => @admin_professore.to_param
    end

    assert_redirected_to admin_professores_path
  end
end
